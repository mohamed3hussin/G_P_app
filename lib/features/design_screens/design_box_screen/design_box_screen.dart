
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height:context.deviceHeight ,
              width:  context.deviceWidth,
              child: Image.asset(AssetsData.DrawingImage)),
          /// Canvas
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

          /// pencil size
          // Positioned(
          //   top: MediaQuery.of(context).padding.top + 80,
          //   right: 0,
          //   bottom: 150,
          //   child: RotatedBox(
          //     quarterTurns: 3, // 270 degree
          //     child: Slider(
          //       value: selectedWidth,
          //       min: 1,
          //       max: 20,
          //       onChanged: (value) {
          //         setState(() {
          //           selectedWidth = value;
          //         });
          //       },
          //     ),
          //   ),
          // ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(bottom: 10.h),
              child: Row(
                children:
                [
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                    child: CustomButton(
                        backgroundColor: CustomColors.blue,
                        text: 'Add To Cart',
                        func:(){},
                        style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w400),
                        radius: 20.r,
                        icon: IconBroken.Buy,
                        iconColor: Colors.white,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 7.w),
                    child: CustomButton(
                      backgroundColor: Color(0xffFDFDFD),
                      text: '',
                      func:()
                      {
                        // setState(() {
                        //   if (drawingPoints.length < historyDrawingPoints.length) {
                        //     // 6 length 7
                        //     final index = drawingPoints.length;
                        //     drawingPoints.add(historyDrawingPoints[index]);
                        //   }
                        // });
                      },
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
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
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