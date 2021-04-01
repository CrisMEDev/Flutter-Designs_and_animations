import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'dart:ui';



class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  // Objetos para animar el circularProgress
  AnimationController animationController;
  Animation animacion;

  @override
  void initState() {
    
    animationController = new AnimationController(
      vsync: this,
      duration: Duration( milliseconds: 2000 )
    );

    animationController.addListener(() {

      // print('Valor controller: ${animationController.value}');
      setState(() {
        // Para cada valor en el rango porcentaje-nuevoPorcentaje; aplica una relacion 1 a 1 por cada controller.value
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, animationController.value);
      });

    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon( Icons.refresh ),
          backgroundColor: Colors.pink,
          onPressed: (){
            setState(() {
              porcentaje = nuevoPorcentaje;
              nuevoPorcentaje += 10;
              if ( nuevoPorcentaje > 100 ) {nuevoPorcentaje = porcentaje = 0;}


              animationController.forward( from: 0.0 );
            });
          }

        ),

        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.70,
            height: MediaQuery.of(context).size.height * 0.35,
            // color: Colors.red,

            child: CustomPaint(
              painter: _MiRadialProgressPainter( porcentaje: porcentaje ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgressPainter extends CustomPainter{

  final double porcentaje;

  _MiRadialProgressPainter({ @required this.porcentaje });

  @override
  void paint(Canvas canvas, Size size) {

    // Dibujar circulo
    final paint = new Paint()
      ..strokeWidth = 5
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final Offset centro = new Offset(size.width * 0.50, size.height * 0.50);
    final double radio = Math.min(size.width * 0.50, size.height * 0.50);

    canvas.drawCircle(centro, radio, paint);

    // Dibujar arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;
    
    // Parte que se deberá ir llenando
    double arcAngle = 2 * Math.pi * ( porcentaje / 100 );
    canvas.drawArc(
      Rect.fromCircle(center: centro, radius: radio),
      -Math.pi / 2,
      arcAngle,
      false,
      paintArco
    );

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
