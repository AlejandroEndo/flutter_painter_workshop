import 'dart:math';

import 'package:flutter/material.dart';

import 'ball_shadow.dart';
import 'prediction_sphere.dart';
import 'prediction_window.dart';
import 'sample/prediction.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall>
    with SingleTickerProviderStateMixin {
  static const lightOffset = Offset(0, -0.75);
  static const restPosition = Offset(0, -0.15);

  Offset tapPosition = Offset.zero;

  late AnimationController animController;
  late Animation anim;

  String prediction = 'Hola mundo';
  double wooble = 0.0;
  @override
  void initState() {
    animController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        reverseDuration: Duration(milliseconds: 1500));

    animController.addListener(() => setState(() {}));

    anim = CurvedAnimation(
      parent: animController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.elasticIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size.square(MediaQuery.of(context).size.shortestSide);
    final Offset windowPosition =
        Offset.lerp(restPosition, tapPosition, anim.value)!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic 8 Ball'),
      ),
      body: Center(
        child: Stack(
          children: [
            BallShadow(
              diameter: size.shortestSide,
            ),
            GestureDetector(
              onPanStart: (dragDetails) =>
                  _start(dragDetails.localPosition, size),
              onPanUpdate: (dragDetails) =>
                  _update(dragDetails.localPosition, size),
              onPanEnd: (dragDetails) => _end(),
              child: PredictionSphere(
                diameter: size.shortestSide,
                lightOffset: lightOffset,
                child: Transform(
                  origin: size.center(Offset.zero),
                  transform: Matrix4.identity()
                    ..translate(windowPosition.dx * size.width / 2,
                        windowPosition.dy * size.height / 2)
                    ..rotateZ(windowPosition.direction)
                    ..rotateY(windowPosition.distance * pi / 2)
                    ..rotateZ(-windowPosition.direction)
                    ..scale(0.5 - 0.15 * windowPosition.distance),
                  child: PredictionWindow(
                    lightOffset: lightOffset - windowPosition,
                    child: Opacity(
                      opacity: 1,//1 - animController.value,
                      child: Transform.rotate(
                        angle: wooble,
                        child: Prediction(
                          text: prediction,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _start(Offset offset, Size size) {
    animController.forward(from: 0);
    _update(offset, size);
  }

  void _update(Offset position, Size size) {
    Offset tapPosition = Offset(
      (2 * position.dx / size.width) - 1,
      (2 * position.dy / size.height) - 1,
    );
    
    final double maxDistance = 0.9;
    if (tapPosition.distance > maxDistance)
      tapPosition = Offset.fromDirection(tapPosition.direction, maxDistance);
    setState(() => this.tapPosition = tapPosition);
  }

  void _end() {
    final rand = Random();
    wooble = rand.nextDouble() * (wooble.isNegative ? 0.5 : -0.5);
    prediction = predictions[rand.nextInt(predictions.length)];
    animController.reverse(from: 1);
  }
}
