
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/data/api/upload_image_api.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/custom_button.dart';
import 'design_box_model.dart';

class DrawingRoomScreen extends StatefulWidget {
  static const String routeName = 'drawing_room';
  const DrawingRoomScreen({super.key});


  @override
  State<DrawingRoomScreen> createState() => _DrawingRoomScreenState();
}

class _DrawingRoomScreenState extends State<DrawingRoomScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  File? _imageFile;
  var avaiableColor = [
    Colors.black,
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.brown,
  ];

  var historyDrawingPoints = <DrawingPoint>[];
  var drawingPoints = <DrawingPoint>[];

  var selectedColor = Colors.black;
  var selectedWidth = 5.0;

  DrawingPoint? currentDrawingPoint;
  String uploadImage = '';

  @override
  void _takeScreenshot() async {
    final time = DateTime.now().toIso8601String().replaceAll('.', '-').replaceAll(':', '-');
    final directory = (await getApplicationDocumentsDirectory()).path;
    final fileName = '$directory/screenshot_$time.png';

    screenshotController.capture().then((image) {
      if (image != null) {
        File imgFile = File(fileName);
        imgFile.writeAsBytesSync(image);
        UploadImageApi().uploadImage(image, fileName).then((value)
        {
          print(value.toString());
          setState(() {
            uploadImage = value['location'].toString();
          });
        }).catchError((error)
        {
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

  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Data;
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          body: Stack(
            children: [
              Screenshot(
                controller: screenshotController,
                child: Stack(
                  children: [
                    SizedBox(
                        height:context.deviceHeight ,
                        width:  context.deviceWidth,
                        child: Image.network(args.productPictures![0])),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Container(
                        height: 370.h,
                        width: 240.w,
                        decoration: BoxDecoration(
                          border: DashedBorder.fromBorderSide(
                              dashLength: 5,
                              side: BorderSide(color: Colors.black, width: 2)),
                        ),
                        child: GestureDetector(
                          onPanStart: (details) {
                            setState(() {
                              currentDrawingPoint = DrawingPoint(
                                id: DateTime.now().microsecondsSinceEpoch,
                                offsets: [
                                  details.localPosition,
                                ],
                                color: selectedColor,
                                width: selectedWidth,
                              );

                              if (currentDrawingPoint == null) return;
                              drawingPoints.add(currentDrawingPoint!);
                              historyDrawingPoints = List.of(drawingPoints);
                            });
                          },
                          onPanUpdate: (details) {
                            setState(() {
                              if (currentDrawingPoint == null) return;

                              currentDrawingPoint = currentDrawingPoint?.copyWith(
                                offsets: currentDrawingPoint!.offsets
                                  ..add(details.localPosition),
                              );
                              drawingPoints.last = currentDrawingPoint!;
                              historyDrawingPoints = List.of(drawingPoints);
                            });
                          },
                          onPanEnd: (_) {
                            currentDrawingPoint = null;
                          },
                          child: CustomPaint(
                            painter: DrawingPainter(
                              drawingPoints: drawingPoints,
                            ),
                            child: SizedBox(
                              width: 240.w,
                              height: 370.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// color pallet
              Positioned(
                top: 40.h,
                left: 16.w,
                right: 16.w,
                child: SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: avaiableColor.length,
                    separatorBuilder: (_, __) {
                      return const SizedBox(width: 8);
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = avaiableColor[index];
                          });
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: avaiableColor[index],
                            shape: BoxShape.circle,
                          ),
                          foregroundDecoration: BoxDecoration(
                            border: selectedColor == avaiableColor[index]
                                ? Border.all(color: Colors.black, width: 4)
                                : null,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 10.h),
                  child: Row(
                    children:
                    [
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                        child: CustomButton(
                          backgroundColor: CustomColors.blue,
                          text: 'Add To Cart',
                          func:()
                          {
                            List<Map<String, dynamic>> items = [
                              {
                                'id': args.id,
                                'productName': args.name,
                                'pictureUrl':'$uploadImage',
                                'size': args.productSize![0].sizename,
                                'color':args.productColor![0].colorname,
                                'price':args.price,
                                'quantity': 1,
                              }
                            ];

                            Map<String, dynamic> requestData = {
                              'id': 'basket1',
                              'items': items,
                            };
                            HomeCubit.get(context).updateCart(data: requestData);
                            HomeCubit.get(context).convertCartToJson();
                            Navigator.pop(context);
                          },
                          style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w400),
                          radius: 20.r,
                          icon: IconBroken.Buy,
                          iconColor: Colors.white,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                        child: CustomButton(
                          backgroundColor: Color(0xffFDFDFD),
                          text: '',
                          func:  _takeScreenshot,
                          style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w400),
                          radius: 20.r,
                          icon:IconBroken.Download,
                          iconColor: CustomColors.blue,
                        ),
                      ),
                      CustomButton(
                        backgroundColor: Color(0xffFDFDFD),
                        text: '',
                        func:()
                        {
                          if (drawingPoints.isNotEmpty && historyDrawingPoints.isNotEmpty) {
                            setState(() {
                              drawingPoints.removeLast();
                            });
                          }
                        },
                        style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w400),
                        radius: 20.r,
                        icon:Icons.undo,
                        iconColor: CustomColors.blue,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                        child: CustomButton(
                          backgroundColor: Color(0xffFDFDFD),
                          text: '',
                          func:()
                          {
                            setState(() {
                              if (drawingPoints.length < historyDrawingPoints.length) {
                                // 6 length 7
                                final index = drawingPoints.length;
                                drawingPoints.add(historyDrawingPoints[index]);
                              }
                            });
                          },
                          style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w400),
                          radius: 20.r,
                          icon:Icons.redo,
                          iconColor: CustomColors.blue,
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),

        );
      },
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;

  DrawingPainter({required this.drawingPoints});

  @override
  void paint(Canvas canvas, Size size) {
    for (var drawingPoint in drawingPoints) {
      final paint = Paint()
        ..color = drawingPoint.color
        ..isAntiAlias = true
        ..strokeWidth = drawingPoint.width
        ..strokeCap = StrokeCap.round;

      for (var i = 0; i < drawingPoint.offsets.length; i++) {
        var notLastOffset = i != drawingPoint.offsets.length - 1;

        if (notLastOffset) {
          final current = drawingPoint.offsets[i];
          final next = drawingPoint.offsets[i + 1];
          canvas.drawLine(current, next, paint);
        } else {
          /// we do nothing
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}