import 'dart:math';

import 'package:flutter/material.dart';

class PredictionWindow extends StatelessWidget {
  const PredictionWindow({
    Key? key,
    required this.lightOffset,
    required this.child,
  }) : super(key: key);

  final Offset lightOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final innerShadowWidth = lightOffset.distance * 0.1;
    final portalShadowOffset =
        Offset.fromDirection(pi + lightOffset.direction, innerShadowWidth);

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(portalShadowOffset.dx, portalShadowOffset.dy),
          colors: [
            Color(0x661F1F1F),
            Colors.black,
          ],
          stops: [1 - innerShadowWidth, 1],
        ),
      ),
      child: child,
    );
  }
}
