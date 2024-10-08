import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/text_style/styles.dart';
import '../../../../product_details/product_details_view.dart';

class ProductItemBuilder extends StatefulWidget {
  Data data;

  ProductItemBuilder(this.data, {super.key});

  @override
  State<ProductItemBuilder> createState() => _ProductItemBuilderState();
}

class _ProductItemBuilderState extends State<ProductItemBuilder> {
  bool isFavorite=false;

  @override
  Widget build(BuildContext context) {
    List<Color>? colors = widget.data.productColor
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
            Navigator.pushNamed(context, ProductDetailsView.routeName,arguments: widget.data);
          },
          child: SizedBox(
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
                        SizedBox(
                          height: 150.h,
                          width: 155.w,
                          child: Image.network(
                            widget.data.productPictures?[0] ?? '',
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
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: ()
                            {
                              isFavorite=true;
                              setState(() {

                              });
                              List<Map<String, dynamic>> items = [
                                {
                                  'id': widget.data.id,
                                  'productName': widget.data.name,
                                  'pictureUrl': widget.data.productPictures![0],
                                  'size': widget.data.productSize![0].sizename,
                                  'type': widget.data.type,
                                  'price': widget.data.price,
                                  'quantity': 1,
                                }
                              ];

                              Map<String, dynamic> requestData = {
                                'id': 'wishlist1',
                                'items': items,
                              };
                              cubit.updateWishList(data: requestData);
                            },
                            icon: CircleAvatar(
                              radius: 20.w,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                isFavorite?Icons.favorite:Icons.favorite_border,
                                color: const Color(0xFFEA3A3D),
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
                          Text(widget.data.name ?? '',
                              style: Styles.textStyle12.copyWith(
                                  color: const Color(0xFF1B72C0),
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text("${widget.data.price.toString()} \$ " ?? '',
                              style: Styles.textStyle14.copyWith(
                                  color: Colors.black, fontWeight: FontWeight.w500)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${(widget.data.price!/0.8).toStringAsFixed(2)} \$ ",
                                style: Styles.textStyle12.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Text('20% OFF',
                                  style: Styles.textStyle14.copyWith(
                                      color: const Color(0xFF117828),
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: 10,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(width: 2.w,),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  setCircularAvatarColor(
                                      colors[index]),
                              itemCount: widget.data.productColor!.length,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                double.parse(widget.data.averageRate!.toStringAsFixed(2)).toString() ?? '',
                                style: Styles.textStyle12.copyWith(
                                    color: Colors.black, fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    List<Map<String, dynamic>> items = [
                                      {
                                        'id': widget.data.id,
                                        'productName': widget.data.name,
                                        'pictureUrl': widget.data.productPictures![0],
                                        'size': widget.data.productSize![0].sizename,
                                        'color':widget.data.productColor![0].colorname,
                                        'price': widget.data.price,
                                        'quantity': 1,
                                      }
                                    ];

                                    Map<String, dynamic> requestData = {
                                      'id': 'basket1',
                                      'items': items,
                                    };
                                    cubit.updateCart(data: requestData);
                                    cubit.convertCartToJson();
                                  },
                                  icon: CircleAvatar(
                                    radius: 20.w,
                                    backgroundColor: const Color(0xFF1B72C0),
                                    child: const Icon(
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
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.black, // Border color
        width: 1.0, // Border width
      ),
    ),
    child: CircleAvatar(
      backgroundColor: color,
      radius: 7.0,
    ),
  )
  ;
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