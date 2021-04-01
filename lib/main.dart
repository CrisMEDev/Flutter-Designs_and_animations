import 'package:flutter/material.dart';

// import 'package:backgrounds_custom_painter/src/pages/headers_page.dart';
// import 'package:backgrounds_custom_painter/src/retos/cuadrado_animado_page.dart';
import 'package:backgrounds_custom_painter/src/pages/circular_progress_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      home: CircularProgressPage(),
    );
  }
}