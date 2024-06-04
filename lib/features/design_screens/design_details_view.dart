import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/features/design_screens/widgets/design_payment.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/product_details/widgets/buttons_row.dart';
import 'package:g_p_app/features/product_details/widgets/color_line.dart';
import 'package:g_p_app/features/product_details/widgets/getBottomSheet.dart';
import 'package:g_p_app/features/product_details/widgets/product_counter.dart';
import 'package:g_p_app/features/product_details/widgets/size_line.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../core/assets_data/iconBroken.dart';
import '../../core/colors/colors.dart';
import '../../core/text_style/styles.dart';
import '../../data/api/upload_image_api.dart';
import '../../data/model/response/AllProductResponse.dart';
import '../product_details/added_to_cart_alert.dart';
import 'design_box_screen/design_box_screen.dart';

class DesignDetailsView extends StatefulWidget {
  static const String routeName = 'design_details';

  @override
  State<DesignDetailsView> createState() => _DesignDetailsViewState();
}

class _DesignDetailsViewState extends State<DesignDetailsView> {
  ScreenshotController screenshotControllerLogo = ScreenshotController();
  File? _imageFile;
  bool isPressed = false;
  bool isVisible = false;
  String selectedDesignImage = '';
  int selectedDesignIndex = -1;
  double selectedDesignCost = 0;

  void updateSelectedDesignCost(double cost) {
    setState(() {
      selectedDesignCost = cost;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var cubit = BlocProvider.of<HomeCubit>(context);
      cubit.getLogos();
    });
  }

  String uploadImage = '';

  void _takeScreenshot() async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final directory = (await getApplicationDocumentsDirectory()).path;
    final fileName = '$directory/screenshot_$time.png';

    screenshotControllerLogo.capture().then((image) {
      if (image != null) {
        File imgFile = File(fileName);
        imgFile.writeAsBytesSync(image);
        UploadImageApi().uploadImage(image, fileName).then((value) {
          print(value.toString());
          setState(() {
            uploadImage = value['location'].toString();
          });
        }).catchError((error) {
          print(error);
        });
        setState(() {
          _imageFile = imgFile;
          print(_imageFile!.path);
        });
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  File? imagePicked;

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagePicked = File(image!.path);
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        String selectedColor = args.productColor![0].colorname!;
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: Color(0xFFEFF1F8),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                IconBroken.Arrow___Left_2,
                color: CustomColors.blue,
              ),
            ),
            leadingWidth: 40.w,
            title: Text(
              'Design',
              style: Styles.textStyle24,
            ),
            titleSpacing: 4,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconBroken.Search,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconBroken.Buy,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Screenshot(
                  controller: screenshotControllerLogo,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 380.w,
                        height: 345.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(args.productPictures![0]),
                          ),
                        ),
                        child: Center(
                          child: Container(
                              height: 160.h,
                              width: 115.w,
                              decoration: BoxDecoration(
                                border: DashedBorder.fromBorderSide(
                                    dashLength: 5,
                                    side: BorderSide(
                                        color: Colors.black, width: 2)),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  if (isPressed)
                                    Image.network(selectedDesignImage),
                                  if (imagePicked != null)
                                    Image.file(imagePicked!),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: getMachineModel(context,
                            name: cubit.logo![selectedDesignIndex].name,
                            type: 'Logo',
                            imagePath:
                                cubit.logo![selectedDesignIndex].pictureUrl,ratio: 1/0.8),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        args.name ?? '',
                        style: Styles.textStyle20!
                            .copyWith(color: CustomColors.blue, fontSize: 18),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "${args.price.toString()} \$",
                        style: Styles.textStyle20!
                            .copyWith(color: CustomColors.green, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizeLine(),
                      SizedBox(
                        height: 15.h,
                      ),
                      ColorLine(
                        onColorSelected: (color) {
                          selectedColor = color;
                          print(color);
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Pick a design you like',
                        style: Styles.textStyle20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.all(8.r),
                        width: 345.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: CustomColors.blue)),
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1 / 1.1,
                              children: cubit.logo !=
                                      null // Check if listTestLogo is not null
                                  ? List.generate(
                                      cubit.logo!.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          isPressed = true;
                                          imagePicked = null;
                                          selectedDesignImage =
                                              cubit.logo![index].pictureUrl!;
                                          isVisible = true;
                                          selectedDesignIndex = index;
                                          setState(() {});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: selectedDesignIndex == index
                                                ? CustomColors.lightBlue
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              selectedDesignIndex == index
                                                  ? 12
                                                  : 8,
                                            ),
                                            border: Border.all(
                                              color:
                                                  selectedDesignIndex == index
                                                      ? CustomColors.blue
                                                      : Colors.grey,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Image.network(
                                                  cubit.logo![index]
                                                          .pictureUrl ??
                                                      '',
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                child: Text(
                                                  "${cubit.logo![index].cost.toString()} \$",
                                                  style: Styles.textStyle12!
                                                      .copyWith(
                                                    color: CustomColors.green,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : [], // Empty list when cubit.logoResponse is null
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     margin: EdgeInsets.symmetric(vertical: 15.h),
                            //     width: 135,
                            //     height: 26,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(12.r),
                            //       color: CustomColors.lightBlue,
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           'Load More',
                            //           style: Styles.textStyle14!
                            //               .copyWith(color: Colors.black),
                            //         ),
                            //         Icon(Icons.keyboard_arrow_down_rounded)
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: CustomColors.blue,
                              child: Icon(
                                Icons.edit,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DrawingRoomScreen.routeName,
                                  arguments: args);
                            },
                          ),
                          CustomButton(
                            backgroundColor: CustomColors.blue,
                            text: 'Upload Design',
                            func: () {
                              pickImageFromGallery();
                            },
                            style: Styles.textStyle16!
                                .copyWith(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                            width: 225.w,
                          )
                        ],
                      ),
                      Visibility(
                          visible: isVisible,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              ProductCounter((p0) {}),
                              SizedBox(
                                height: 30.h,
                              ),
                              cubit.logo != null &&
                                      cubit.logo!
                                          .isNotEmpty // Check again before accessing logo data
                                  ? DesignPayment(
                                      cubit.logo![selectedDesignIndex == -1
                                          ? 0
                                          : selectedDesignIndex],
                                      args,
                                    )
                                  : CircularProgressIndicator(),
                            ],
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                              width: 120.w,
                              height: 50.h,
                              backgroundColor: CustomColors.blue,
                              radius: 18,
                              text: 'Save Logo',
                              func: _takeScreenshot,
                              style: Styles.textStyle16
                                  .copyWith(color: Colors.white)),
                          CustomButton(
                              width: 205.w,
                              height: 50.h,
                              backgroundColor: Colors.white,
                              radius: 18,
                              icon: Icons.shopping_cart,
                              text: 'Add to Cart',
                              func: () {
                                List<Map<String, dynamic>> items = [
                                  {
                                    'id': args.id,
                                    'productName': args.name,
                                    'pictureUrl': '$uploadImage',
                                    'size': args.productSize![0].sizename,
                                    'color': args.productColor![0].colorname,
                                    'price': isPressed
                                        ? args.price! +
                                            cubit
                                                .logo![selectedDesignIndex].cost
                                        : args.price! + 50.0,
                                    'quantity': 1,
                                  }
                                ];

                                Map<String, dynamic> requestData = {
                                  'id': 'basket1',
                                  'items': items,
                                };
                                HomeCubit.get(context)
                                    .updateCart(data: requestData);
                                HomeCubit.get(context).convertCartToJson();
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      Dialog(child: AddedToCartAlert()),
                                );
                              },
                              style: Styles.textStyle16
                                  .copyWith(color: CustomColors.blue)),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
