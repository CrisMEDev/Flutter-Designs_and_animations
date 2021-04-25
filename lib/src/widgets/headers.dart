import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class HeaderWavesGradient extends StatelessWidget {

  final Color color;

  const HeaderWavesGradient({ @required this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(
        painter: _HeaderWavesGradientPainter( this.color ),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter{

  final Color color;

  _HeaderWavesGradientPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(165.0, 55.0),  // El gradiente está de manera horizontal, por eso dy no se ve afectado
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(  // CircularGradient()

      // Poner gradiente en vertical
      // begin: Alignment.topCenter,
      // end: Alignment.bottomCenter,

      colors: [
        Color( 0xFF6D05E8 ),
        this.color, // Color( 0xFFC012FF ),
        Color( 0xFF6D05FA ),
      ],

      stops: [  // Puntos porcentuales donde queremos que cada color trabaje, basados en el rango establecido en
                // el center del rect, oscila entre 0.0 y 1.0. En este caso, 3 colores por tanto 3 PUNTOS
        0.2,
        0.5,
        1.0

      ]
    );


    final paint = new Paint()..shader = gradiente.createShader(rect);
    final path = new Path();

    // Propiedades
    // paint.color = Colors.red; // Se ignora el color por el uso del shader
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

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo, subtitulo;
  final Color color1, color2;

  const IconHeader({
    @required this.icon,
    @required this.titulo,
    @required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);
    final screenSize = MediaQuery.of(context).size;
    double ancho;
    
    ( screenSize.width > 500 ) ? ancho = screenSize.width * 0.70 : ancho = screenSize.width;

    return Stack(
      children: [
        _IconHeaderBackground( this.color1, this.color2 ),
        Positioned(
          top: -50.0,
          left: -70.0,
          child: FaIcon( this.icon, size: ancho * 0.65, color: Colors.white.withOpacity(0.2), ),
        ),
        Column(
          children: [
            SizedBox(height: 80.0, width: double.infinity,),  // Como los widgets están centrados en base al mas largo se usa
                                                              // el double.infinity aqui
            Text(this.subtitulo, style: TextStyle( fontSize: ancho * 0.06, color: colorBlanco )),
            SizedBox(height: 20.0),
            Text(this.titulo, style: TextStyle( fontSize: ancho * 0.06 + 5, color: colorBlanco, fontWeight: FontWeight.bold )),
            SizedBox(height: 20.0),
            FaIcon( this.icon, size: ancho * 0.2, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground(
    this.color1,
    this.color2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(80.0) ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1,
            this.color2,
          ]
        )
      ),
    );
  }
}

