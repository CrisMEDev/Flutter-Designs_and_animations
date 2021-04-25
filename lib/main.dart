import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:backgrounds_custom_painter/src/pages/launcher_page.dart';
import 'package:backgrounds_custom_painter/src/theme/theme.dart';
// import 'package:backgrounds_custom_painter/src/pages/sliver_list.dart';
// import 'package:backgrounds_custom_painter/src/pages/emergency_page.dart';
// import 'package:backgrounds_custom_painter/src/pages/pinterest_page.dart';
// import 'package:backgrounds_custom_painter/src/pages/slideshows_page.dart';
// import 'package:backgrounds_custom_painter/labs/slideshow_page.dart';
// import 'package:backgrounds_custom_painter/src/pages/graficas_circualres_page.dart';
// import 'package:backgrounds_custom_painter/src/pages/headers_page.dart';
// import 'package:backgrounds_custom_painter/src/retos/cuadrado_animado_page.dart';
// import 'package:backgrounds_custom_painter/labs/circular_progress_page.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new ThemeChanger( 2 ),   // Almacenar este entero en las preferencias de usuario para mantener el tema del usuario
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {  // Al cambiar la orientacion se dispara este builder

          print(orientation);
          
          return Container(
            child: LauncherPage(),
          );
        },
      ),

      theme: Provider.of<ThemeChanger>(context).currentTheme,
    );
  }
}