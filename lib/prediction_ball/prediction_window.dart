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
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Color(0x661F1F1F),
            Colors.black,
          ],
        ),
      ),
      child: child,
    );
  }
}
