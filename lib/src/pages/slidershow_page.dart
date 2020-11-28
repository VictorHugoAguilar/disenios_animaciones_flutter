import 'package:flutter/material.dart';

import 'package:app_backgrounds_customs/src/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slideshow(
          puntosArriba: false,
          colorPrimario: Colors.greenAccent,
          colorSecundario: Colors.grey,
          slides: [
            SvgPicture.asset('assets/svg/slide-1.svg'),
            SvgPicture.asset('assets/svg/slide-2.svg'),
            SvgPicture.asset('assets/svg/slide-3.svg'),
            SvgPicture.asset('assets/svg/slide-4.svg'),
            SvgPicture.asset('assets/svg/slide-5.svg'),
            Center(child: Text('Hola')),
          ],
        ),
      ),
    );
  }
}
