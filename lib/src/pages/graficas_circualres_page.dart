import 'package:flutter/material.dart';

import 'package:backgrounds_custom_painter/src/widgets/radial_progress.dart';

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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.20,
          height: MediaQuery.of(context).size.width * 0.20,
          // color: Colors.red,

          child: RadialProgress(
            porcentaje: porcentaje,
            colorPrimario: Colors.green,
            colorSecundario: Colors.brown,
            grosorSecundario: 5.0,
            grosorPrimario: 5.0,
          ),
        )
      ),
    );
  }
}
