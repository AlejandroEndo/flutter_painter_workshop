import 'dart:math';

import 'package:flutter/material.dart';
import '../core/utils.dart';

class PolygonPainter extends CustomPainter {
  PolygonPainter({required this.sides, required this.position});
  final double sides;
  final int position;
  @override
  void paint(Canvas canvas, Size size) {
    double cx = size.width / 2;
    double cy = size.height / 2;
    Offset center = Offset(cx, cy);

    double r = size.width * 0.5 - position * 3;
    //double sides = 7.5;
    Path path = Path();

    path.moveTo(cx + r * cos(0), cy + r * sin(0));

    for (double a = 0; a < 360; a += (360 / sides)) {
      final angle = degreesToRadians(a);
      double x = cx + r * cos(angle);
      double y = cx + r * sin(angle);
      path.lineTo(x, y);
    }

    path.close();

    Paint paint = Paint()
    // ..style = PaintingStyle.stroke
    // ..strokeWidth = 5.0
    ..color = Colors.white.withOpacity(0.3);

    Paint strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0
    ..color = Colors.white;

    canvas.drawPath(path, paint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
