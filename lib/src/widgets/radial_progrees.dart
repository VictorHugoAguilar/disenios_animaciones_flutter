import 'package:flutter/material.dart';
import 'dart:math';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final double anchoPrimario;
  final Color colorSecundario;
  final double anchoSecundario;

  const RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.anchoPrimario = 10,
    this.colorSecundario = Colors.grey,
    this.anchoSecundario = 1,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * animationController.value),
              widget.colorPrimario,
              widget.anchoPrimario,
              widget.colorSecundario,
              widget.anchoSecundario,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final double anchoPrimario;
  final Color colorSecundario;
  final double anchoSecundario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.anchoPrimario,
    this.colorSecundario,
    this.anchoSecundario,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6d05E8),
        Colors.red,
      ],
    );

    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180,
    );

    // Circulo completado
    final paint = new Paint()
      ..strokeWidth = anchoSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = anchoPrimario
      //..color = colorPrimario
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Parte que se ira llenando
    final double fStartAngle = -pi / 2;

    final double arcAngle = 2 * pi * (porcentaje / 100);
    final double fSweepAngle = arcAngle;

    final bool fUseCenter = false;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      fStartAngle,
      fSweepAngle,
      fUseCenter,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
