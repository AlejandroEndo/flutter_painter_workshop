import 'package:flutter/material.dart';
import 'fire_painter.dart';

class FireView extends StatefulWidget {
  const FireView({ Key? key }) : super(key: key);

  @override
  _FireViewState createState() => _FireViewState();
}

class _FireViewState extends State<FireView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: FirePainer(),
      ),
    );
  }
}