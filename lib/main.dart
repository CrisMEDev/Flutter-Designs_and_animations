import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:backgrounds_custom_painter/src/models/layout_model.dart';
import 'package:backgrounds_custom_painter/src/theme/theme.dart';
import 'package:backgrounds_custom_painter/src/pages/launcher_tablet_page.dart';
import 'package:backgrounds_custom_painter/src/pages/launcher_page.dart';
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
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (context) => new ThemeChanger(2)), // Almacenar este entero en las preferencias de usuario para
                                                                  // mantener el tema del usuario
      ChangeNotifierProvider<LayoutModel>(create: (context) => new LayoutModel()),
    ],
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

          // print(orientation);
          final screenSize = MediaQuery.of(context).size;

          if ( screenSize.width > 500 ){
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }


          // return Container(
          //   child: LauncherPage(),
          // );
        },
      ),

      theme: Provider.of<ThemeChanger>(context).currentTheme,
    );
  }
}