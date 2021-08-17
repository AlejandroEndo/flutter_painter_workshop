import 'dart:math';

import 'package:flutter/material.dart';
import '../core/utils.dart';
import 'polygon_painter.dart';

class PolygonTile extends StatefulWidget {
  const PolygonTile({
    Key? key,
    required this.index,
    required this.size,
    required this.ran,
    required this.sides,
    this.distance = 15.0,
  }) : super(key: key);

  final int index;
  final Size size;
  final double distance;
  final Random ran;
  final double sides;

  @override
  _PolygonTileState createState() => _PolygonTileState();
}

class _PolygonTileState extends State<PolygonTile>
    with TickerProviderStateMixin {
  late Animation<double> anim;
  late AnimationController animController;
  late Tween<double> sidesTween = Tween(begin: 3, end: 8);
  late double _sides;
  double angle = 0;
  @override
  void initState() {
    super.initState();

    _sides = widget.sides;

    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000 + widget.index * 500),
      value: 0.5,
    );

    anim = sidesTween.animate(animController)
      ..addListener(() {
        if (_sides > angle)
          angle += 0.001 + (widget.index * 0.0001);
        else if (_sides < angle) {
          angle -= 0.001 +(widget.index * 0.0001);
        }
        if (_sides != widget.sides) {
          // Future.delayed(Duration(milliseconds: widget.index * 500));
          _sides = widget.sides;
        } else {
          // _sides += 0.001;
        }
        if (animController.value != angle) {
          animController.animateTo(angle);
        }
          // if (animController.status == AnimationStatus.forward) {
          //   animController.reverse();
          // } else {
          //   animController.forward();
          // }
      })
      ..addStatusListener((status) {
        // animController.animateTo(widget.sides);
        if (status == AnimationStatus.completed) {
          // animController.animateTo(widget.sides);
          // animController.forward();
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
          // animController.animateTo(widget.sides);
        }
      });
    animController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(anim.value);
    return Transform(
      origin: widget.size.center(Offset.zero),
      transform: Matrix4.identity()
        ..setEntry(2, 3, 0.002)
        ..rotateX(degreesToRadians(60))
        ..rotateZ(angle * pi)
        ..translate(0, 0, -widget.distance * widget.index),
      child: CustomPaint(
        size: widget.size,
        painter: PolygonPainter(
          sides: 6,
          position: widget.index,
        ),
      ),
    );
  }
}
