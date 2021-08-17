import 'package:flutter/material.dart';
import 'fire_particle.dart';

class FireView extends StatefulWidget {
  const FireView({Key? key}) : super(key: key);

  @override
  _FireViewState createState() => _FireViewState();
}

class _FireViewState extends State<FireView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Fire Pit'),
      ),
      body: Stack(
        children: fireParticleBuilder(100),
      ),
    );
  }

  List<Widget> fireParticleBuilder(int amount) {
    List<Widget> particles = [];
    for (int i = 0; i < amount; i++) {
      particles.add(
        FireParticle(),
      );
    }
    return particles;
  }
}
