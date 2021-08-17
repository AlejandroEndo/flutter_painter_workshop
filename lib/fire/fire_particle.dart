import 'dart:math';

import 'package:flutter/material.dart';
import '../core/utils.dart';
import 'fire_painter.dart';

class FireParticle extends StatefulWidget {
  const FireParticle({Key? key}) : super(key: key);

  @override
  _FireParticleState createState() => _FireParticleState();
}

class _FireParticleState extends State<FireParticle>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  late Tween<double> tween = Tween(begin: 0, end: 1);

  late Random random = Random();
  late Offset pos = Offset(0.5, 1);

  double wiggleSpd = 0.15;
  final double maxR = 100;
  final double minR = 50;
  late double finalR;

  double wiggle = 0;
  double r = 0;

  late Color color;

  @override
  void initState() {
    loadValues();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: random.nextInt(1000) + 1000,
      ),
      value: random.nextDouble(),
    );

    animation = tween.animate(animationController)
      ..addListener(() {
        double remap = pmap(
            value: animationController.value,
            min: 0,
            max: 1,
            newMin: 1,
            newMax: 0);
        wiggle += wiggleSpd;

        r = pmap(
          value: animationController.value,
          min: 0,
          max: 1,
          newMin: finalR,
          newMax: 1,
        );

        double wOffset = pmap(
          value: animationController.value,
          min: 0,
          max: 1,
          newMin: 0.15,
          newMax: 0.1,
        );

        Offset wiggleLimit = Offset(0.5 - wOffset, 0.5 + wOffset);

        double newW = pmap(
          value: sin(wiggle),
          min: -1,
          max: 1,
          newMin: wiggleLimit.dx,
          newMax: wiggleLimit.dy,
        );

        setState(() => pos = Offset(newW, remap));
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          loadValues();
          animationController.reset();
          animationController.forward();
        }
      });

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide;
    return Positioned(
      width: size,
      height: size,
      bottom: 0,
      child: CustomPaint(
        // size: Size.square(size.shortestSide),
        painter: FirePainer(pos: pos, r: r, color: color),
      ),
    );
  }

  void loadValues() {
    random = Random();
    finalR = (random.nextDouble() * maxR) + minR;
    wiggleSpd = random.nextDouble() * 0.15;
    wiggle = random.nextDouble() * 100;
    List<int> rgb = hsvToRgb(random.nextDouble() * 50, 100, 100);
    color = Color.fromARGB(200, rgb[0], rgb[1], rgb[2]);
  }
}
