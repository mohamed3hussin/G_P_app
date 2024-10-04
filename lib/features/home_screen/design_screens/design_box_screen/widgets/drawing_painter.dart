import 'dart:ui';
import 'package:flutter/material.dart';
import '../design_box_model.dart';

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

      for (int i = 0; i < drawingPoint.offsets.length - 1; i++) {
        canvas.drawLine(
          drawingPoint.offsets[i],
          drawingPoint.offsets[i + 1],
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}