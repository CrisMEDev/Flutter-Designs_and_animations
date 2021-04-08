import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsLocation;
  final Color dotPrimaryColor;
  final Color dotSecondaryColor;

  const Slideshow({
    @required this.slides,
    this.dotsLocation = false,
    this.dotPrimaryColor = Colors.blue,
    this.dotSecondaryColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderModel(),

      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context){  // El builder construye primero los widgets superiores
                                              // y despues trabaja en base al context, en este caso es usado
                                              // para instanciar el provider en el mismo nivel donde se crea y
                                              // poder usar los colores primario y secundario
              
              Provider.of<_SliderModel>(context).dotPrimaryColor = this.dotPrimaryColor;
              Provider.of<_SliderModel>(context).dotSecondaryColor = this.dotSecondaryColor;

              return _CrearEstructuraSlideshow(dotsLocation: dotsLocation, slides: slides);
            }
          ),
          )
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.dotsLocation,
    @required this.slides,
  }) : super(key: key);

  final bool dotsLocation;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if ( dotsLocation ) _Dots( 
          dotsNumber: this.slides.length,
        ),
        Expanded(
          child: _Slides( slides: this.slides )
        ),
        if ( !dotsLocation ) _Dots( 
          dotsNumber: this.slides.length,
        ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {

  final int dotsNumber;

  const _Dots({
    this.dotsNumber,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        // Método generate de clase List permite generar una lista de objetos en base a una longitud
        children: List.generate(dotsNumber, ( dot ) => _Dot(
          paginaActual: dot.toDouble(),
        ))
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final double paginaActual;

  const _Dot({
    @required this.paginaActual,
  });

  @override
  Widget build(BuildContext context) {

    final slideshowModel = Provider.of<_SliderModel>(context);

    return AnimatedContainer(
      duration: Duration( milliseconds: 500 ),
      curve: Curves.decelerate,

      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric( horizontal: 5.0 ),
      decoration: BoxDecoration(
        color: ( slideshowModel.paginaActual >= paginaActual -  0.5 && slideshowModel.paginaActual < paginaActual + 0.5 )
                ? slideshowModel.dotPrimaryColor : slideshowModel.dotSecondaryColor,
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
      Provider.of<_SliderModel>(context, listen: false).paginaActual = pageController.page;
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

class _SliderModel with ChangeNotifier{

  double _paginaActual = 0;
  Color _dotPrimaryColor = Colors.blue;
  Color _dotSecondaryColor = Colors.grey;

  double get paginaActual => this._paginaActual;
         set paginaActual(double pagina) {
           this._paginaActual = pagina;
           notifyListeners();
        }

  Color get dotPrimaryColor => this._dotPrimaryColor;
        set dotPrimaryColor( Color colorPrimario ){
          this._dotPrimaryColor = colorPrimario;
          notifyListeners();
        }

  Color get dotSecondaryColor => this._dotSecondaryColor;
        set dotSecondaryColor( Color colorSecundario ){
          this._dotSecondaryColor = colorSecundario;
          notifyListeners();
        }

}


