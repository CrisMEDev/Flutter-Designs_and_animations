import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;

  RadialProgress( {@required this.porcentaje } );

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text( widget.porcentaje.toString() ),       // widget hace referencia a el mismo para usar el porcentaje
      padding: EdgeInsets.all( 5.0 ),
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(
        painter: _MiRadialProgressPainter(porcentaje: widget.porcentaje),
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

