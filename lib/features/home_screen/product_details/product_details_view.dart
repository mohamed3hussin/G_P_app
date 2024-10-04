import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/checkout_buynow_screen.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/buttons_row.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/color_line.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/product_counter.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/product_description.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/product_title_and_price.dart';
import 'package:g_p_app/features/home_screen/product_details/widgets/size_line.dart';


class ProductDetailsView extends StatefulWidget {
  static const String routeName = 'product_details';

  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavorite = false;
  int counterValue = 1;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
    String selectedSize = args.productSize![0].sizename!;
    String selectedColor = args.productColor![0].colorname!;
    var cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: const Text(
          'Product Details',
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Search,
                color: Color(0xFF1B72C0),
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Icon(
                    IconBroken.Buy,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                    child: Text(
                      '${cubit.listCartItems?.length ?? 0}',
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  color: CustomColors.lightGrey,
                  width: MediaQuery.sizeOf(context).width,
                  height: 280.h,
                  child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: CustomColors.blue,
                    indicatorBottomPadding: 20.h,
                    indicatorRadius: 7,
                    isLoop: true,
                    children: args.productPictures!
                        .map((url) => Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.network(
                                url,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            isFavorite = true;
                            setState(() {});
                          },
                          icon: CircleAvatar(
                            radius: 25.w,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: const Color(0xFFEA3A3D),
                                size: 40.w,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10.h),
                      width: 35.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: CustomColors.lightGrey,
                          borderRadius: BorderRadius.circular(3.r)),
                    ),
                  ),
                  const ProductTitleLine(),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizeLine(onSizeSelected: (size) {
                    selectedSize = size;
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  ColorLine(
                    onColorSelected: (color) {
                      selectedColor = color;
                    },
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProductDescription(),
                      SizedBox(
                        height: 40.h,
                      ),
                      ProductCounter((value) {
                        setState(() {
                          counterValue =
                              value; // Update the counter value in the main screen
                        });
                      }),
                      ButtonsRow(
                        addToCart: () {
                          List<Map<String, dynamic>> items = [
                            {
                              'id': args.id,
                              'productName': args.name ?? '',
                              'pictureUrl': args.productPictures![0],
                              'size': selectedSize ?? '',
                              'color': selectedColor ?? '',
                              'price': args.price,
                              'quantity': counterValue,
                            }
                          ];

                          Map<String, dynamic> requestData = {
                            'id': 'basket1',
                            'items': items,
                          };
                          cubit.updateCart(
                              data: requestData, quantity: counterValue);
                        },
                        buyNow: () {
                          Map<String, dynamic> items = {
                            'id': args.id,
                            'productName': args.name ?? '',
                            'pictureUrl': args.productPictures![0],
                            'size': selectedSize ?? '',
                            'color': selectedColor ?? '',
                            'price': args.price,
                            'quantity': counterValue,
                          };
                          cubit.buyNowForPayment(items);
                          Navigator.pushNamed(
                              context, CheckOutScreenBuyNow.routeName,
                              arguments: items);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
