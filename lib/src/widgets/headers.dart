import 'package:flutter/material.dart';
import 'package:app_backgrounds_customs/src/utils/utils.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: getColorFromHex('#f78ae0'),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: getColorFromHex('#f78ae0'),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: getColorFromHex('#f78ae0'),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    // propiedades
    paint.color = getColorFromHex('#f78ae0');
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1.0;

    final path = new Path();

    // Dibujar con el path y el lápiz(paint)
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: getColorFromHex('#f78ae0'),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    // propiedades
    paint.color = getColorFromHex('#f78ae0');
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1.0;

    final path = new Path();

    // Dibujar con el path y el lápiz(paint)
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    // Dibujar con el path y el lápiz(paint)
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: getColorFromHex('#f78ae0'),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    // propiedades
    paint.color = getColorFromHex('#f78ae0');
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 14.0;

    final path = new Path();

    // Dibujar con el path y el lápiz(paint)
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: getColorFromHex('#f78ae0'),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    // propiedades
    paint.color = getColorFromHex('#f78ae0');
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 14.0;

    final path = new Path();

    // Dibujar con el path y el lápiz(paint)
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.4,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: getColorFromHex('#f78ae0'),
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    // propiedades
    paint.color = getColorFromHex('#f78ae0');
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 14.0;

    final path = new Path();

    // Dibujar con el path y el lápiz(paint)
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.25,
    );

    path.quadraticBezierTo(
      size.width * 0.70,
      size.height * 0.17,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: getColorFromHex('#f78ae0'),
      child: CustomPaint(
        painter: _HeaderWavePainterGradiente(),
      ),
    );
  }
}

class _HeaderWavePainterGradiente extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          getColorFromHex('6D05E8'),
          getColorFromHex('C012FF'),
          getColorFromHex('6D05FA'),
        ],
        stops: [
          0.0,
          0.5,
          1.0,
        ]);

    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 60.0),
      radius: 180,
    );

    final paint = new Paint()..shader = gradient.createShader(rect);

    // propiedades
    // paint.color = getColorFromHex('#f78ae0');
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 14.0;

    final path = new Path();

    // Dibujar con el path y el lápiz(paint)
    path.lineTo(0, size.height * 0.25);
    // path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.5,
      size.height * 0.25,
    );

    path.quadraticBezierTo(
      size.width * 0.70,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
