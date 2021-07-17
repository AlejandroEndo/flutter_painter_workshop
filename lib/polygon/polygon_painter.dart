import 'dart:math';

import 'package:flutter/material.dart';

class PolygonPainter extends CustomPainter {
  PolygonPainter(this.sides);
  double sides;
  @override
  void paint(Canvas canvas, Size size) {
    double cx = size.width / 2;
    double cy = size.height / 2;
    Offset center = Offset(cx, cy);

    double r = size.width * 0.5;
    //double sides = 7.5;
    Path path = Path();

    path.moveTo(cx + r * cos(0), cy + r * sin(0));
    for (double a = 0; a < 360; a += (360 / sides)) {
      double x = cx + r * cos(a * pi / 180);
      double y = cx + r * sin(a * pi / 180);
      path.lineTo(x, y);
    }
    path.close();

    Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0
    ..color = Colors.red;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
