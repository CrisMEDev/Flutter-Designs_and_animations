import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.blueGrey,
    this.grosorPrimario = 10.0,
    this.grosorSecundario = 5.0,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  double porcentajeAnterior;

  @override
  void initState() {
    
    porcentajeAnterior = widget.porcentaje;

    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    animationController.forward( from: 0.0 ); // from 0.0 para que cada vez que se reconstruya el widget empiece desde 0
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: animationController,
      
      builder: ( context, child ){
        return Container(
          // child: Text( widget.porcentaje.toString() ),       // widget hace referencia a el mismo para usar el porcentaje
          padding: EdgeInsets.all( 5.0 ),
          width: double.infinity,     // Se dejan los infinitys para que se tome como referencia el tamaño del padre
          height: double.infinity,

          child: CustomPaint(
            painter: _MiRadialProgressPainter(
              porcentaje: widget.porcentaje - diferenciaAnimar + ( diferenciaAnimar * animationController.value),
              colorPrimario: widget.colorPrimario,
              colorSecundario: widget.colorSecundario,
              grosorPrimario: widget.grosorPrimario,
              grosorSecundario: widget.grosorSecundario
            ),
          ),
        );
      }
    );
 
  }
}

class _MiRadialProgressPainter extends CustomPainter{

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgressPainter({
    @required this.porcentaje,
    @required this.colorPrimario,
    @required this.colorSecundario,
    @required this.grosorPrimario,
    @required this.grosorSecundario
  });

  @override
  void paint(Canvas canvas, Size size) {

    // Dibujar circulo
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;

    final Offset centro = new Offset(size.width * 0.50, size.height * 0.50);
    final double radio = Math.min(size.width * 0.50, size.height * 0.50);

    canvas.drawCircle(centro, radio, paint);

    // Dibujar arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorPrimario
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

