import 'package:backgrounds_custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:backgrounds_custom_painter/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class GraficaCircularPage extends StatefulWidget {
  @override
  _GraficaCircularPageState createState() => _GraficaCircularPageState();
}

class _GraficaCircularPageState extends State<GraficaCircularPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if ( porcentaje > 100 ) porcentaje = 0;
          });
        }
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.blue,
                colorSecundario: Colors.grey,),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.2,
                colorPrimario: Colors.grey,
                colorSecundario: Colors.white38,),
            ],
          ),
          SizedBox( height: 15.0, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje * 1.4,
                colorPrimario: Colors.deepOrangeAccent,
                colorSecundario: Colors.deepPurpleAccent,),
              CustomRadialProgress(
                porcentaje: porcentaje * 1.6,
                colorPrimario: Colors.black,
                colorSecundario: Colors.cyan,),
            ],
          ),
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color colorPrimario;
  final Color colorSecundario;

  const CustomRadialProgress({
    @required this.porcentaje,
              this.colorPrimario,
              this.colorSecundario
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.width * 0.40,
      // color: Colors.red,

      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: ( appTheme.darkTheme ) ? appTheme.currentTheme.textTheme.bodyText1.color : appTheme.currentTheme.primaryColorLight,
        grosorSecundario: 5.0,
        grosorPrimario: 5.0,
      ),
    );
  }
}
