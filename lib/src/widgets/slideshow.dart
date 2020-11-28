import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:app_backgrounds_customs/src/models/slider_model.dart';

// import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  const Slideshow({
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.pink,
    this.colorSecundario = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              if (this.puntosArriba)
                _Dots(
                  slides.length,
                  this.colorPrimario,
                  this.colorSecundario,
                ),
              Expanded(
                child: _Slides(slides),
              ),
              if (!this.puntosArriba)
                _Dots(
                  slides.length,
                  this.colorPrimario,
                  this.colorSecundario,
                ),
            ],
          ),
        ),
      ),
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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dots(
    this.totalSlide,
    this.colorPrimario,
    this.colorSecundario,
  );

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
        children: List.generate(
            this.totalSlide,
            (index) => _Dot(
                  index,
                  this.colorPrimario,
                  this.colorSecundario,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color colorPrimario;
  final Color colorSecundario;

  const _Dot(this.index, this.colorPrimario, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    // print('_Dot $pageViewIndex');

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? this.colorPrimario
            : this.colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}
