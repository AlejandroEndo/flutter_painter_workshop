import 'dart:math';

import 'package:flutter/material.dart';

class BallShadow extends StatelessWidget {
  const BallShadow({Key? key, required this.diameter}) : super(key: key);

  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateX(pi / 2.1),
      origin: Offset(0, diameter),
          child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.grey.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
