import 'package:flutter/material.dart';

class FirePainer extends CustomPainter {
  FirePainer({
    required this.pos,
    required this.r,
    required this.color,
  });
  final Offset pos;
  final double r;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Offset newPos = Offset(size.width * pos.dx, size.height * pos.dy);
    canvas.drawCircle(newPos, r, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
