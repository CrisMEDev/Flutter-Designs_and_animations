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
                porcentaje: porcentaje,
                colorPrimario: Colors.grey,
                colorSecundario: Colors.white38,),
            ],
          ),
          SizedBox( height: 15.0, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.deepOrangeAccent,
                colorSecundario: Colors.deepPurpleAccent,),
              CustomRadialProgress(
                porcentaje: porcentaje,
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: MediaQuery.of(context).size.width * 0.40,
      // color: Colors.red,

      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorSecundario: 5.0,
        grosorPrimario: 5.0,
      ),
    );
  }
}
