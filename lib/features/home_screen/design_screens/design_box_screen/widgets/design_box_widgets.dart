import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import '../../../../../core/assets_data/iconBroken.dart';
import '../design_box_model.dart';
import 'drawing_painter.dart';


// Builds the drawing area
Widget buildDrawingArea({
  required List<DrawingPoint> drawingPoints,
  required Function(DragStartDetails) onPanStart,
  required Function(DragUpdateDetails) onPanUpdate,
  required Function() onPanEnd,
}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      height: 370.h,
      width: 240.w,
      decoration: BoxDecoration(
        border: DashedBorder.fromBorderSide(
          dashLength: 5,
          side: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      child: GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: (_) => onPanEnd(),
        child: CustomPaint(
          painter: DrawingPainter(drawingPoints: drawingPoints),
          child: SizedBox(width: 240.w, height: 370.h),
        ),
      ),
    ),
  );
}

// Builds the color palette
Widget buildColorPalette({
  required List<Color> availableColors,
  required Color selectedColor,
  required Function(Color) onColorSelected,
}) {
  return Positioned(
    top: 40.h,
    left: 16.w,
    right: 16.w,
    child: SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: availableColors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onColorSelected(availableColors[index]),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: availableColors[index],
                shape: BoxShape.circle,
              ),
              foregroundDecoration: BoxDecoration(
                border: selectedColor == availableColors[index]
                    ? Border.all(color: Colors.black, width: 4)
                    : null,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    ),
  );
}

// Builds the bottom buttons
Widget buildBottomButtons({
  required VoidCallback onAddToCart,
  required VoidCallback onTakeScreenshot,
  required VoidCallback onUndo,
  required VoidCallback onRedo,
}) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          buildCustomButton(
            text: 'Add To Cart',
            icon: IconBroken.Buy,
            color: CustomColors.blue,
            onPressed: onAddToCart,
          ),
          buildCustomButton(
            text: '',
            icon: IconBroken.Download,
            color: CustomColors.blue,
            onPressed: onTakeScreenshot,
          ),
          buildCustomButton(
            text: '',
            icon: Icons.undo,
            color: CustomColors.blue,
            onPressed: onUndo,
          ),
          buildCustomButton(
            text: '',
            icon: Icons.redo,
            color: CustomColors.blue,
            onPressed: onRedo,
          ),
        ],
      ),
    ),
  );
}

// Helper function to create custom buttons
Widget buildCustomButton({
  required String text,
  required IconData icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: CustomButton(
      backgroundColor: const Color(0xffFDFDFD),
      text: text,
      func: onPressed,
      style: Styles.textStyle14.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      radius: 20.r,
      icon: icon,
      iconColor: color,
    ),
  );
}
