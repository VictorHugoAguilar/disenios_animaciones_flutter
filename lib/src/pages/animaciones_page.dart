import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  // propiedades
  AnimationController animationController;
  Animation<double> animationRotation;

  Animation<double> animationOpacity;
  Animation<double> animationOpacityOut;

  Animation<double> animationMove;
  Animation<double> animationScale;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    animationRotation =
        // Tween(begin: 0.0, end: 2.0 * Math.pi).animate(animationController);

        // Añaidiendo CurvedAnimation
        Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationOpacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        // curve: Curves.easeOut,
        curve: Interval(
          0,
          0.75,
          curve: Curves.easeOut,
        ),
      ),
    );

    animationOpacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        // curve: Curves.easeOut,
        curve: Interval(
          0.75,
          1,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    animationMove = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationScale = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.addListener(() {
      // print('Status: $animationController.status ');

      if (animationController.status == AnimationStatus.completed) {
        // animationController.reverse();
        animationController.reset();
      }
    });

    // play
    // animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // play
    animationController.forward();
    // repetición
    // animationController.repeat();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        // print(animationRotation.value);
        return Transform.scale(
          scale: animationScale.value,
          child: Transform.translate(
            offset: Offset(animationMove.value, 0),
            child: Transform.rotate(
              angle: animationRotation.value,
              child: Opacity(
                opacity: animationOpacity.value - animationOpacityOut.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
