import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/dashboard/ui/products/widgets/product_dashboard_item_widget.dart';

import '../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../../logic/dashBoardCubit/dashboard_state.dart';
import '../widget/delete_product_alert.dart';
import 'edit_product_screen/edit_item.dart';

class ProductDashboard extends StatefulWidget {
  static const String routeName = 'product_dashboard_view';

  const ProductDashboard({super.key});

  @override
  State<ProductDashboard> createState() => _ProductDashboardState();
}

class _ProductDashboardState extends State<ProductDashboard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: DashboardCubit.get(context),
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.allProducts != null,
          builder: (context) {
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.allProducts?.data?.length,
                itemBuilder: (context, index) {
                  var product = cubit.allProducts!.data![index];
                  return ProductItem(
                    index: index,
                    product: product,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditItem(
                            product.name??'',
                            product.price.toString(),
                            product.typeId.toString(),
                            product.quantity.toString(),
                            product.productSize![0].sizeId!,
                            product.productStatus.toString(),
                            product.genderType??'',
                            product.description??'',
                            product.productColor![0].colorId!,
                            'false',
                            product.productPictures![0].toString(),
                            product.id!,
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: DeleteProductAlert(
                            'Want To delete this product?',
                            'You will delete this item if you click the delete button',
                            product.id.toString(),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
