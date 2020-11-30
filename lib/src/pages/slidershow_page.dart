import 'package:app_backgrounds_customs/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:app_backgrounds_customs/src/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final Color accentColor = appTheme.currentTheme.accentColor;

    return Scaffold(
      body: Center(
        child: Slideshow(
          puntosArriba: false,
          colorPrimario: appTheme.darkTheme ? accentColor : Colors.pinkAccent,
          colorSecundario: Colors.grey,
          bulletPrimario: 15,
          bulletSecundario: 10,
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
