import 'package:flutter/material.dart';

class PredictionSphere extends StatelessWidget {
  const PredictionSphere({
    Key? key,
    required this.diameter,
    required this.lightOffset,
    required this.child,
  }) : super(key: key);

  final double diameter;
  final Offset lightOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Colors.grey, Colors.black],
          center: Alignment(lightOffset.dx, lightOffset.dy),
        ),
        // color: Colors.black,
      ),
      child: child,
    );
  }
}
