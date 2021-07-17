import 'package:flutter/material.dart';

class MatrixView extends StatefulWidget {
  const MatrixView({Key? key}) : super(key: key);

  @override
  _MatrixViewState createState() => _MatrixViewState();
}

class _MatrixViewState extends State<MatrixView> {
  double x = 0;
  double y = 0;
  double z = 0;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4(
        1, 0, 0, 0, //
        0, 1, 0, 0, //
        0, 0, 1, 0, //
        0, 0, 0, 1, //
      )
        ..rotateX(x)
        ..rotateY(y)
        ..rotateZ(z),
      alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            y = y - details.delta.dx * 0.01;
            // x = x - details.delta.dy * 0.01;
          });
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.grey,
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
