import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget { // Se necesitara cambiar el estado constantemente para animar, por ello
                                                // se usa un stateful, así como para limpiar el consumo de memoria usado

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  AnimationController animationController;    // Es el que le dará las indicaciones a la animacion de como debe hacerlo
  Animation<double> rotacion;                 // Controlar los valores que fluiran en la misma animacion
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration( milliseconds: 4000 )
    );

    // La rotación pasará de 0 a 1 vuelta en 4 segundos
    rotacion = Tween( begin: 0.0, end: 2.0 * Math.pi ).animate(
      // animationController
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut )
    );

    // La opacidad siempre va de cero a uno
    opacidad = Tween( begin: 0.1, end: 1.0 ).animate(
      // animationController
      CurvedAnimation(parent: animationController, curve: Interval(0, 0.25, curve: Curves.bounceOut) ) // Para hacer la opacity en 25% de los 4000ms
    );

    opacidadOut = Tween( begin: 0.0, end: 1.0 ).animate(
      // animationController
      CurvedAnimation(parent: animationController, curve: Interval(0.75, 1.0, curve: Curves.bounceOut) ) // Para hacer la opacity en 25% de los 4000ms
    );

    // Para mover 200 pixeles el cuadrado
    moverDerecha = Tween( begin: 0.0, end: 200.0 ).animate(
      // animationController
      CurvedAnimation(parent: animationController, curve: Curves.easeOut )
    );

    // Reducirlo desde 2 veces su tamaño original hasta cero
    agrandar = Tween( begin: 2.0, end: 0.0 ).animate(
      // animationController
      CurvedAnimation(parent: animationController, curve: Curves.easeOut )
    );

    animationController.addListener(() {
      // print('Status: ${animationController.status}');

      if (animationController.status == AnimationStatus.completed){
        // animationController.reverse();
        animationController.reset();
      }

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

    // Inicia la animacion
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),

      builder: (BuildContext context, Widget childRectangulo) {

        // print(opacidad.value);
        // print(rotacion.value);
        // print('Opacidad: ${opacidad.status}');
        // print('Rotacion: ${rotacion.status}');

        return Transform.translate(
          offset: Offset( moverDerecha.value , 0),
          child: Transform.rotate(
            angle: rotacion.value,

            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo
              ),
            )
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
    );
   }
}

