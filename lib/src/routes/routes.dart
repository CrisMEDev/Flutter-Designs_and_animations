import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgrounds_custom_painter/src/pages/slideshows_page.dart';
import 'package:backgrounds_custom_painter/src/pages/headers_page.dart';
import 'package:backgrounds_custom_painter/src/pages/emergency_page.dart';
import 'package:backgrounds_custom_painter/src/pages/graficas_circualres_page.dart';
import 'package:backgrounds_custom_painter/src/pages/pinterest_page.dart';
import 'package:backgrounds_custom_painter/src/pages/sliver_list.dart';
import 'package:backgrounds_custom_painter/src/retos/cuadrado_animado_page.dart';


final pageRoutes = <_Route>[

  _Route( FontAwesomeIcons.slideshare, 'Slideshow',  SlideshowPage()),
  _Route( FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage() ),
  _Route( FontAwesomeIcons.heading, 'Encabezados', HeadersPage() ),
  _Route( FontAwesomeIcons.peopleCarry, 'Cuadro animado', CuadradoAnimadoPage() ),
  _Route( FontAwesomeIcons.circleNotch, 'Barra progreso', GraficaCircularPage() ),
  _Route( FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage() ),
  _Route( FontAwesomeIcons.mobile, 'Slivers', SliverListPage() ),

];


class _Route{

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(
    this.icon,
    this.titulo,
    this.page
  );

}

