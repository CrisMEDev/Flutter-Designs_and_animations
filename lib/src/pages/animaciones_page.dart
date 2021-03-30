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
    opacidad = Tween( begin: 0.1, end: 1.0 ).animate(animationController);

    animationController.addListener(() {
      print('Status: ${animationController.status}');

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

        // print(rotacion.value);

        return Transform.rotate(
          angle: rotacion.value,

          child: Opacity(
            opacity: opacidad.value,
            child: childRectangulo,
          )
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

