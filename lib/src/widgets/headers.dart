import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final resolucion = MediaQuery.of(context).size;
    print('width: ${resolucion.width}, height: ${resolucion.height}');
    return Container(
      height: resolucion.height / 3,

      color: Color( 0xFF615AAB ), // Se agrego 0xFF como sintaxis para que acepte el color DART, es color CSS en si

    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final resolucion = MediaQuery.of(context).size;

    return Container(
      height: resolucion.height / 3,

      decoration: BoxDecoration(
        color: Color( 0xFF615AAB ), // Se agrego 0xFF como sintaxis para que acepte el color DART, es color CSS en si
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40) ),
      ),
    );
  }
}

