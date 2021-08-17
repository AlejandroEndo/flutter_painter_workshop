import 'package:flutter/material.dart';
import 'clock/clock_view.dart';
import 'fire/fire_view.dart';
import 'polygon/polygon_view.dart';

import 'prediction_ball/magic_ball.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ModuleButton(page: ClockView(), name: 'Animated Clock'),
            ModuleButton(page: MagicBall(), name: 'Magic 8 ball'),
            ModuleButton(page: PolygonView(), name: 'PolyShape'),
            ModuleButton(page: FireView(), name: 'Fire Pit'),
          ],
        ),
      ),
    );
  }
}

class ModuleButton extends StatelessWidget {
  const ModuleButton({
    Key? key,
    required this.page,
    required this.name,
  }) : super(key: key);

  final Widget page;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(name),
    );
  }
}
