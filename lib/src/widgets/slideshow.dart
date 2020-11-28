import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// import 'package:app_backgrounds_customs/src/models/slider_model.dart';
// import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.pink,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideshowModel>(context).colorPrimario =
                this.colorPrimario;
            Provider.of<_SlideshowModel>(context).colorSecundario =
                this.colorSecundario;
            Provider.of<_SlideshowModel>(context).bulletPrimario =
                this.bulletPrimario;
            Provider.of<_SlideshowModel>(context).bulletSecundario =
                this.bulletSecundario;

            return _CrearEstructuraSlideshow(
                puntosArriba: puntosArriba, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.puntosArriba) _Dots(slides.length),
        Expanded(
          child: _Slides(slides),
        ),
        if (!this.puntosArriba) _Dots(slides.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(
    this.slides,
  );

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // print('Pagina actual ${pageViewController.page}');
      // Actualizar el provider la instancia de la clase sliderModel
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        /* children: <Widget>[
          _Slide(rutaSvg: 'assets/svg/slide-1.svg'),
          _Slide(rutaSvg: 'assets/svg/slide-2.svg'),
          _Slide(rutaSvg: 'assets/svg/slide-3.svg'),
        ], */
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlide;

  const _Dots(this.totalSlide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        /*   children: [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ], */
        children: List.generate(this.totalSlide, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    // print('_Dot $pageViewIndex');
    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamanoBullet;
    Color colorBullet;

    if ((ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5)) {
      tamanoBullet = ssModel.bulletPrimario;
      colorBullet = ssModel.colorPrimario;
    } else {
      tamanoBullet = ssModel.bulletSecundario;
      colorBullet = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: tamanoBullet,
      height: tamanoBullet,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: colorBullet,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.pink;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }
}
