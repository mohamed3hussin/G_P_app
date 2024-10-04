import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../../logic/dashBoardCubit/dashboard_state.dart';
import 'dashboard_product_item.dart';

class DesignProductDashboard extends StatefulWidget {
  static const String routeName = 'design_product_dashboard';

  const DesignProductDashboard({super.key});

  @override
  State<DesignProductDashboard> createState() => _DesignProductDashboardState();
}

class _DesignProductDashboardState extends State<DesignProductDashboard> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: DashboardCubit(),
      builder: (context, state) {
        var cubit = DashboardCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.allDesignedProducts != null,
          builder: (context) {
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.allDesignedProducts?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return DashBoardProductItem(
                    product: cubit.allDesignedProducts!.data![index],
                    cubit: cubit,
                  );
                },
              ),
            );
          },
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
