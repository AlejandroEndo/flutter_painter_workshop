import 'package:flutter/material.dart';

class PredictionSphere extends StatelessWidget {
  const PredictionSphere(
      {Key? key, required this.diameter, required this.lightOffset})
      : super(key: key);

  final double diameter;
  final Offset lightOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Colors.grey, Colors.black],
          center: Alignment(lightOffset.dx, lightOffset.dy),
        ),
        // color: Colors.black,
      ),
    );
  }
}
