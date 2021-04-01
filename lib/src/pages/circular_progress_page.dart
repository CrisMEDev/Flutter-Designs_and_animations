import 'package:flutter/material.dart';

import 'dart:math' as Math;

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.70,
          height: MediaQuery.of(context).size.height * 0.35,
          // color: Colors.red,

          child: CustomPaint(
            painter: _MiRadialProgressPainter( porcentaje: 40 ),
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
