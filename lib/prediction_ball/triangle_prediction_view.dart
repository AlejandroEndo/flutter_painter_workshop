import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_painter_workshop/prediction_ball/triangle_prediction_painter.dart';

class TrianglePredictionView extends StatelessWidget {
  const TrianglePredictionView({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePredictionPainter(),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

final List<String> predictions =
  String.fromCharCodes(
    base64.decode(
      'QXMgSSBzZWUgaXQsDQp5ZXN8QXNrIGFnYWluDQpsYXRlcnxCZXR0ZXIgbm90'
      'DQp0ZWxsIHlvdQ0Kbm93fENhbm5vdA0KcHJlZGljdA0Kbm93fENvbmNlbnRy'
      'YXRlDQphbmQgYXNrDQphZ2FpbnxEb24ndCBjb3VudA0Kb24gaXR8SXQgaXMN'
      'CmNlcnRhaW58SXQgaXMNCmRlY2lkZWRseQ0Kc298TW9zdCBsaWtlbHl8TXkg'
      'cmVwbHkNCmlzIG5vfE15IHNvdXJjZXMNCnNheSBub3xOb3xPdXRsb29rDQpn'
      'b29kfE91dGxvb2sgbm90DQpzbyBnb29kfFJheSBXZW5kZXJsaWNoDQpoYXMg'
      'YSBjb3Vyc2UNCm9uIGl0fFJlcGx5IGhhenkgLQ0KdHJ5IGFnYWlufFNpZ25z'
      'DQpwb2ludCB0bw0KeWVzfEZsdXR0ZXIgaGFzDQp0aGUgYW5zd2VyfFZlcnkN'
      'CmRvdWJ0ZnVsfFdpdGhvdXQgYQ0KZG91YnR8WWVzfFllcywgZGVmaW5pdGVs'
      'eXxZb3UgbWF5DQpyZWx5IG9uDQppdA=='
    )
  )
  .split('|');