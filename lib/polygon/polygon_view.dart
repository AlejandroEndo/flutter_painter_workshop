import 'package:flutter/material.dart';
import 'package:flutter_painter_workshop/polygon/polygon_painter.dart';

class PolygonView extends StatefulWidget {
  const PolygonView({Key? key}) : super(key: key);

  @override
  _PolygonViewState createState() => _PolygonViewState();
}

class _PolygonViewState extends State<PolygonView>
    with TickerProviderStateMixin {
  late Animation<double> anim;
  late AnimationController animController;

  late Tween<double> sidesTween = Tween(begin: 3, end: 8);

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    anim = sidesTween.animate(animController)
    ..addListener(() { 
      setState(() {
        
      });
    })
    ..addStatusListener((status) { 
      if(status == AnimationStatus.completed){
        animController.reverse();
      } else if(status == AnimationStatus.dismissed){
        animController.forward();
      }
    });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width,
      color: Colors.grey[300],
      child: CustomPaint(
        painter: PolygonPainter(anim.value),
      ),
    );
  }
}
