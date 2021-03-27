import 'package:flutter/material.dart';

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

  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration( milliseconds: 4000 )
    );

    rotacion = Tween( begin: 0.0, end: 2.0 ).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
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

