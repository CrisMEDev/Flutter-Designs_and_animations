import 'package:backgrounds_custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:backgrounds_custom_painter/src/widgets/headers.dart';
// import 'package:backgrounds_custom_painter/src/pages/animaciones_page.dart';
import 'package:backgrounds_custom_painter/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      // body: HeaderCuadrado(),
      // body: HeaderBordesRedondeados(),
      // body: HeaderTrianguloDerecho(),
      body: HeaderWavesGradient( color: appTheme.accentColor, ),
      // body: AnimacionesPage(),
    );
  }
}

