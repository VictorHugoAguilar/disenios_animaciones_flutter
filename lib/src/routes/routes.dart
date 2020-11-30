import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_backgrounds_customs/src/labs/slideshow_page.dart';
import 'package:app_backgrounds_customs/src/pages/animaciones_page.dart';
import 'package:app_backgrounds_customs/src/pages/emergency_page.dart';
import 'package:app_backgrounds_customs/src/pages/graficas_circulares_page.dart';
import 'package:app_backgrounds_customs/src/pages/headers_page.dart';
import 'package:app_backgrounds_customs/src/pages/pinterest_page.dart';
import 'package:app_backgrounds_customs/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro animado', AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circulo Progreso',
      GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
