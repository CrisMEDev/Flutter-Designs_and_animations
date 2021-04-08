import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:backgrounds_custom_painter/src/models/slider_model.dart';

// TODO: BORRAR
import 'package:flutter_svg/svg.dart';

class Slideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),

      child: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides()
            ),
            _Dots(),
          ],
        )
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot( paginaActual: 0.0, ),
          _Dot( paginaActual: 1.0, ),
          _Dot( paginaActual: 2.0, ),
        ],
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

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageController = new PageController();

  @override
  void initState() {
    
    pageController.addListener(() {

      // print('Página actual: ${ pageController.page }');

      // Actualizar el provider, SliderModel
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
        children: [
          _Slide( assetSvg: 'assets/svg/slide-1.svg', ),

          _Slide( assetSvg: 'assets/svg/slide-2.svg', ),

          _Slide( assetSvg: 'assets/svg/slide-3.svg', )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String assetSvg;

  const _Slide({@required this.assetSvg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),

      child: SvgPicture.asset(
        assetSvg,
        semanticsLabel: 'Logo'
      ),
    );
  }
}


