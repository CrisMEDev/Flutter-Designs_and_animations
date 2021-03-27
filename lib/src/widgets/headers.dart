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

class HeaderTrianguloDerecho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(
        painter: _HeaderTrianguloDerechoPainter(),
      ),
    );
  }
}

class _HeaderTrianguloDerechoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    // Propiedaes del paint
    paint.color = Color( 0xFF615AAB );
    paint.style = PaintingStyle.fill;

    // Dibujar con el path y el paint; El path por defecto esta en (0, 0)
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}


class HeaderPicoAdentro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(
        painter: _HeaderPicoAdentroPainter(),
      ),
    );
  }
}

class _HeaderPicoAdentroPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    // Propiedades
    paint.color = Color( 0xFF615AAB );
    paint.style = PaintingStyle.fill;

    // Dibujar con el path y el paint; El path por defecto esta en (0, 0)
    path.lineTo(0, size.height / 3);
    path.lineTo(size.width / 2, size.height / 3.75);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

class HeaderCurvoAfuera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(
        painter: _HeaderCurvoAfueraPainter(),
      ),
    );
  }
}

class _HeaderCurvoAfueraPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final paint = new Paint();
      final path = new Path();

      // Propiedades
      paint.color = Color( 0xFF615AAB );
      paint.style = PaintingStyle.fill;

      // Camino del path
      path.lineTo(0, size.height / 3);
      path.quadraticBezierTo(size.width / 2, size.height / 2.25, size.width, size.height / 3);  // El primer punto solicitado es el eje de la curvatura
                                                                  // El segundo es el punto donde termina
      // path.lineTo(size.width, size.height / 3);  // Linea en vez de curvatura
      path.lineTo(size.width, 0);


      canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    // Propiedades
    paint.color = Color( 0xFF615AAB );
    paint.style = PaintingStyle.fill;

    // Camino del lienzo
    path.lineTo(0, size.height / 2.75);
    path.quadraticBezierTo(size.width / 4, size.height / 2.35, size.width / 2, size.height / 2.75);
    path.quadraticBezierTo(size.width * 3 / 4, size.height / 3.15, size.width, size.height / 2.75);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

