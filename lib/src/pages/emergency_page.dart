import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:app_backgrounds_customs/src/widgets/big_boton.dart';
import 'package:app_backgrounds_customs/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              child: BigBoton(
                icon: item.icon,
                text: item.texto,
                colorPrimario: item.color1,
                colorSecundario: item.color2,
                onPress: () {
                  print('items');
                },
              ),
            ))
        .toList();

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 50,
                ),
                ...itemMap
              ],
            ),
          ),
          _HeaderEmergency(),
        ],
      ),
    );
  }
}

class BigBotonTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BigBoton(
      icon: FontAwesomeIcons.carCrash,
      text: 'Motor Accident',
      colorPrimario: Color(0xff6989F5),
      colorSecundario: Color(0xff906EF5),
      onPress: () {
        print('click');
      },
    );
  }
}

class _HeaderEmergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'Haz Solicitado',
          colorPrincipal: Color(0xff526BF6),
          colorSecundario: Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 50,
          child: RawMaterialButton(
            onPressed: () {
              print('Menu Puntos');
            },
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.0),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
