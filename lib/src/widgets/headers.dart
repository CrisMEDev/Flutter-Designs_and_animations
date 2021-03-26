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

class HeaderDiagonalDerecha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: double.infinity,

      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }

  
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();    // "Es el lápiz para pintar nuestro cuadro(canvas)"

    // Propiedades
    paint.color = Color( 0xFF615AAB );
    paint.style = PaintingStyle.fill; // .stroke --> Hacer trazos 
    paint.strokeWidth = 2.0; // Ancho del lapiz

    final path = new Path();

    // Dibujar con el path y el paint; El path por defecto esta en (0, 0)
    path.moveTo(0, size.height / 2.75); // Solo mueve el paint sin dibujar
    path.lineTo(size.width, size.height / 3.0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height / 2.75);



    canvas.drawPath( path, paint );

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


