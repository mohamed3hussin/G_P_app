import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/product_details/product_details_view.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/text_style/styles.dart';

class ProductItemBuilder extends StatelessWidget {
  Data data;

  ProductItemBuilder(this.data);

  @override
  Widget build(BuildContext context) {
    List<Color>? colors = data?.productColor
        ?.map(
          (colorMap) => getColorFromName(colorMap.colorname!),
    ).toList() ?? [];
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = HomeCubit.get(context);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailsView.routeName,arguments: data);
          },
          child: Container(
            width: 150.w,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),border: Border.all(color: Colors.grey,width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          height: 150.h,
                          width: 155.w,
                          child: Image.network(
                            data.productPictures?[0] ?? '',
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: CustomColors.blue,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: ()
                            {
                              cubit.updateWishList(
                                  productId: data.id!,
                                  productName: data.name!,
                                  pictureUrl: data.productPictures![0],
                                  size: data.productSize![0].sizename!,
                                  type: data.type!,
                                  quantity: 3,
                                  price: data.price!,
                              );
                            },
                            icon: CircleAvatar(
                              radius: 20.w,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                IconBroken.Heart,
                                color: Color(0xFFEA3A3D),
                                size: 30.w,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name ?? '',
                              style: Styles.textStyle12.copyWith(
                                  color: Color(0xFF1B72C0),
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text("${data.price.toString()} \$ " ?? '',
                              style: Styles.textStyle14.copyWith(
                                  color: Colors.black, fontWeight: FontWeight.w500)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${(data.price!/0.8).toStringAsFixed(2)} \$ ",
                                style: Styles.textStyle12.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Text('20% OFF',
                                  style: Styles.textStyle14.copyWith(
                                      color: Color(0xFF117828),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            height: 10,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(width: 3.w,),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  setCircularAvatarColor(
                                      colors![index]),
                              itemCount: data.productColor!.length,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                double.parse(data.averageRate!.toStringAsFixed(2)).toString() ?? '',
                                style: Styles.textStyle12.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: CircleAvatar(
                                    radius: 20.w,
                                    backgroundColor: Color(0xFF1B72C0),
                                    child: Icon(
                                      IconBroken.Bag_2,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget setCircularAvatarColor(Color? color) {
  return CircleAvatar(
    backgroundColor: color,
    radius: 5,
  );
}

Color getColorFromName(String colorData) {
  switch (colorData.toLowerCase()) {
    case 'green':
      return Colors.green;
    case 'black':
      return Colors.black;
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    default:
      return Colors.white;
  }
}