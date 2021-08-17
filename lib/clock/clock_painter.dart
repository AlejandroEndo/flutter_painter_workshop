import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainer extends CustomPainter {
  DateTime timeNow = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    Paint paint = Paint()..color = Colors.grey[50]!;

    Paint outlinePaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16.0;

    Paint centerDotPaint = Paint()..color = Colors.grey[300]!;

    Paint secPaint = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    Paint minPaint = Paint()
      ..shader = RadialGradient(colors: [Colors.red, Colors.orange])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round;

    Paint hourPaint = Paint()
      ..shader = RadialGradient(colors: [Colors.pink, Colors.purple])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round;


    // CLOCK CASE BACKGROUND
    canvas.drawCircle(center, radius - size.width * 0.01, paint);
    canvas.drawCircle(center, radius - size.width * 0.01, outlinePaint);

    double handR = 120;
    // SECONDS
    double secValueAngle = timeNow.second * (360 / 60);
    double secHandX = centerX + (handR) * cos(secValueAngle * pi / 180);
    double secHandY = centerX + (handR) * sin(secValueAngle * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secPaint);

    // MINUTES
    double minValueAngle = timeNow.minute * (360 / 60);
    double minHandX = centerX + (handR * 0.85) * cos(minValueAngle * pi / 180);
    double minHandY = centerX + (handR * 0.85) * sin(minValueAngle * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minPaint);

    // HOURS
    double hourValueAngle = timeNow.hour * (360 / 12); // Rounded hour value
    double minuteOffset =
        timeNow.minute * ((360 / 12) / 60); // Minutes progress offset
    double hourHandX = centerX +
        (handR * 0.75) * cos((hourValueAngle + minuteOffset) * pi / 180);
    double hourHandY = centerX +
        (handR * 0.75) * sin((hourValueAngle + minuteOffset) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourPaint);

    double lineLenght = radius - 14;
    for(double i = 0; i < 360; i += (360 / 12)){
      double x1 = centerX + radius * cos(i * pi / 180);
      double y1 = centerY + radius * sin(i * pi / 180);

      double x2 = centerX + lineLenght * cos(i * pi / 180);
      double y2 = centerX + lineLenght * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), secPaint);
    }

    // CLOCK CENTER DOT
    canvas.drawCircle(center, 16, centerDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}