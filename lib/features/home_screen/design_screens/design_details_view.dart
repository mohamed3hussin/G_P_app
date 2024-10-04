import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:g_p_app/features/home_screen/design_screens/widgets/design_payment.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../core/assets_data/iconBroken.dart';
import '../../../core/cache_helper/cache_helper.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import '../../../data/api/upload_image_api.dart';
import '../../../data/model/response/AllProductResponse.dart';
import '../product_details/widgets/added_to_cart_alert.dart';
import '../product_details/widgets/color_line.dart';
import '../product_details/widgets/product_counter.dart';
import '../product_details/widgets/size_line.dart';
import 'design_box_screen/design_box_screen.dart';

class DesignDetailsView extends StatefulWidget {
  static const String routeName = 'design_details';

  const DesignDetailsView({super.key});

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
  String networkImagePath='';
  bool isNetworkImagePath=false;
  void updateSelectedDesignCost(double cost) {
    setState(() {
      selectedDesignCost = cost;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
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

  List<String> _imageUrls = [];

  Future<List<String>> uploadImage2(File imageFile) async {
    const String url =
        'https://1a54-41-233-199-23.ngrok-free.app/api/Product/RecommendLogo';
    final dio = Dio();

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imagePicked!.path,
        filename: imagePicked!.path.split('/').last,
        contentType: MediaType("image", "jpeg"),
      ),
    });

    final response = await dio.post(
      url,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'lang': 'en',
          'Authorization': CacheHelper.getData(key: 'token'),
        },
        followRedirects: true,
        validateStatus: (status) {
          return status! < 500; // Accept status codes less than 500
        },
      ),
    );

    print(response.data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.data['recommended_images'];
      final List<String> imageUrls = jsonResponse.cast<String>();
      return imageUrls;
    } else {
      throw Exception('Failed to upload image');
    }
  }

  Future<void> _handleUpload(File image) async {
    _imageUrls = [];
    final imageFile = image;
    try {
      final imageUrls = await uploadImage2(imageFile);
      setState(() {
        _imageUrls = imageUrls;
        _showImageBottomSheet();
        print(_imageUrls);
      });
    } catch (e) {
      print(e.toString());
    }
    }

  void _showImageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return ConditionalBuilder(
              condition: _imageUrls.isNotEmpty,
              builder: (context) {
                return Container(
                  height: 400.h,
                  decoration: BoxDecoration(
                    color: CustomColors.lightGrey,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(7.h),
                            width: 35.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: CustomColors.darkGrey,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                        ),
                        Text('Logo', style: Styles.textStyle16),
                        Expanded(
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 3,
                            childAspectRatio: 1 / 1.1,
                            children: List.generate(
                              _imageUrls.length,
                              (index) => InkWell(
                                onTap: (){
                                  networkImagePath=_imageUrls[index];
                                  isNetworkImagePath=true;
                                  Navigator.pop(context);
                },
                                child: Image.network(
                                  _imageUrls[index],
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
                                                    1)
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return const Center(child: Icon(Icons.error));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
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
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: HomeCubit.get(context),
      builder: (context, state) {
        String selectedColor = args.productColor![0].colorname!;
        String selectedSize = args.productSize![0].sizename!;
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: const Color(0xFFEFF1F8),
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
                  icon: const Icon(
                    IconBroken.Search,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
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
                              decoration: const BoxDecoration(
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
                                  if (isNetworkImagePath)
                                    Image.network(networkImagePath),
                                ],
                              )),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              args.name ?? '',
                              style: Styles.textStyle20
                                  .copyWith(color: CustomColors.blue, fontSize: 18),
                            ),
                          ),
                          imagePicked != null
                              ? IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () async {
                                    _handleUpload(imagePicked!);
                                  },
                                  icon: CircleAvatar(
                                    radius: 25.w,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: CustomColors.blue,
                                        size: 40.w,
                                      ),
                                    ),
                                  ))
                              : const SizedBox()
                        ],
                      ),
                      Text(
                        "${args.price.toString()} \$",
                        style: Styles.textStyle20
                            .copyWith(color: CustomColors.green, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizeLine(onSizeSelected: (size) {
                        selectedSize = size;
                        setState(() {
                        });
                      }),
                      SizedBox(
                        height: 15.h,
                      ),
                      ColorLine(
                        onColorSelected: (color) {
                          selectedColor = color;
                          setState(() {
                          });
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
                              physics: const NeverScrollableScrollPhysics(),
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
                                          isNetworkImagePath=false;
                                          selectedDesignImage =
                                              cubit.logo![index].pictureUrl;
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
                                          child: Center(
                                            child: Image.network(
                                              cubit.logo![index].pictureUrl ??
                                                  '',
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : [], // Empty list when cubit.logoResponse is null
                            ),
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
                              child: const Icon(
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
                            style: Styles.textStyle16
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
                                      args,
                                    )
                                  : const CircularProgressIndicator(),
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
                                    'pictureUrl': uploadImage,
                                    'size': selectedSize,
                                    'color': selectedColor,
                                    'price': args.price,
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
                                      const Dialog(child: AddedToCartAlert()),
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
    );
  }
}
