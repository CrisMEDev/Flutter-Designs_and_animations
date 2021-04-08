import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;

  const Slideshow({
    
    @required this.slides
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),

      child: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides( slides: this.slides )
            ),
            _Dots( dotsNumber: this.slides.length, ),
          ],
        )
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int dotsNumber;

  const _Dots({this.dotsNumber});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        // Método generate de clase List permite generar una lista de objetos en base a una longitud
        children: List.generate(dotsNumber, ( dot ) => _Dot(paginaActual: dot.toDouble()))
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final double paginaActual;

  const _Dot({@required this.paginaActual});

  @override
  Widget build(BuildContext context) {

    final double paginaActualProvider = Provider.of<SliderModel>(context).paginaActual;

    return AnimatedContainer(
      duration: Duration( milliseconds: 500 ),
      curve: Curves.decelerate,

      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric( horizontal: 5.0 ),
      decoration: BoxDecoration(
        color: ( paginaActualProvider >= paginaActual -  0.5 && paginaActualProvider < paginaActual + 0.5 )
                ? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides({this.slides});

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageController = new PageController();

  @override
  void initState() {
    
    pageController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).paginaActual = pageController.page;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageController,
        
        physics: BouncingScrollPhysics(), // Elimina la animación azul presentada en android cuando no hay mas contenido

        children: widget.slides.map( ( slide ) => _Slide(slide: slide) ).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide({this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),

      child: slide
    );
  }
}


