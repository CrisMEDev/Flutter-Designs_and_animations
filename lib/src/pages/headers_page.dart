import 'package:flutter/material.dart';

// import 'package:backgrounds_custom_painter/src/widgets/headers.dart';
// import 'package:backgrounds_custom_painter/src/pages/animaciones_page.dart';
import 'package:backgrounds_custom_painter/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: HeaderCuadrado(),
      // body: HeaderBordesRedondeados(),
      // body: HeaderTrianguloDerecho(),
      body: HeaderWavesGradient(),
      // body: AnimacionesPage(),
    );
  }
}

