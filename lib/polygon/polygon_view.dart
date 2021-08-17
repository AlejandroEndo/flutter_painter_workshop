import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../core/utils.dart';
import 'polygon_tile.dart';

import 'polygon_painter.dart';

class PolygonView extends StatefulWidget {
  const PolygonView({Key? key}) : super(key: key);

  @override
  _PolygonViewState createState() => _PolygonViewState();
}

class _PolygonViewState extends State<PolygonView>
    with TickerProviderStateMixin {
  late Timer timer;
  late bool forward;
  Random ran = Random();
  late double sides;
  // late Animation<double> anim;
  // late AnimationController animController;

  // late Tween<double> sidesTween = Tween(begin: 3, end: 8);

  @override
  void initState() {
    super.initState();
    forward = true;
    sides = 0.1;
    timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      ran = Random();
      bool dir = ran.nextDouble() > 0.9;
      setState(() {
        if(dir){
          sides = ran.nextDouble();
        }
      });
    });

    // animController = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 15),
    //   value: 0.5,
    // );

    // anim = sidesTween.animate(animController)
    //   ..addListener(() {
    //     final ran = Random();
    //     bool dir = ran.nextDouble() > 0.95;
    //     setState(() {
    //       if (dir) {
    //         animController.animateTo(ran.nextDouble());
    //         // if (animController.status == AnimationStatus.forward) {
    //         //   animController.reverse();
    //         // } else {
    //         //   animController.forward();
    //         // }
    //       }
    //     });
    //   })
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       animController.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       animController.forward();
    //     }
    //   });

    // animController.forward();
  }

  @override
  void dispose() {
    // animController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size.square(MediaQuery.of(context).size.shortestSide);
    return Scaffold(
      appBar: AppBar(
        title: Text('PolyShape'),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: _polyBuilder(20, size),
          ),
        ),
      ),
    );
  }

  List<Widget> _polyBuilder(int amount, Size size) {
    List<Widget> polys = [];
    // double angle = degreesToRadians(60);
    double distance = 15.0;
    for (int i = 0; i < amount; i++) {
      // Widget poly = Transform(
      //   origin: size.center(Offset.zero),
      //   transform: Matrix4.identity()
      //     ..setEntry(2, 3, 0.002)
      //     ..rotateX(angle)
      //     ..translate(0.0, 0.0, -distance * i),
      //   child: CustomPaint(
      //     size: size,
      //     painter: PolygonPainter(
      //       sides: anim.value + i * 0.001,
      //       position: i,
      //     ),
      //   ),
      // );
      Widget poly = PolygonTile(
        index: i,
        size: size,
        distance: distance,
        ran: ran,
        sides: sides,
      );
      polys.add(poly);
    }
    return polys;
  }
}
