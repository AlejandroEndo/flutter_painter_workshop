import 'package:flutter/material.dart';
import 'package:flutter_painter_workshop/prediction_ball/ball_shadow.dart';
import 'package:flutter_painter_workshop/prediction_ball/prediction_sphere.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  static const lightOffset = Offset(0, -0.75);
  @override
  Widget build(BuildContext context) {
    Size size = Size.square(MediaQuery.of(context).size.shortestSide);
    return Stack(
      children: [
        BallShadow(
          diameter: size.shortestSide * 0.9,
        ),
        PredictionSphere(
          diameter: size.shortestSide * 0.9,
          lightOffset: lightOffset,
        ),
      ],
    );
  }
}
