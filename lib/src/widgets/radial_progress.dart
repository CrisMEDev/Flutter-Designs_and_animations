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
      child: Text( widget.porcentaje.toString() ),       // widget hace referencia a el mismo para usar el porcentaje
    );
  }
}
