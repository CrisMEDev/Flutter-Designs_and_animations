import 'package:flutter/material.dart';

import 'package:backgrounds_custom_painter/src/pages/slideshows_page.dart';
// import 'package:backgrounds_custom_painter/labs/slideshow_page.dart';
// import 'package:backgrounds_custom_painter/src/pages/graficas_circualres_page.dart';
// import 'package:backgrounds_custom_painter/src/pages/headers_page.dart';
// import 'package:backgrounds_custom_painter/src/retos/cuadrado_animado_page.dart';
// import 'package:backgrounds_custom_painter/labs/circular_progress_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      home: SlideshowPage(),
    );
  }
}