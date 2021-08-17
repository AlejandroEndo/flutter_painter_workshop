import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'clock_painter.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Clock'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainer(),
            ),
          ),
        ),
      ),
    );
  }
}
