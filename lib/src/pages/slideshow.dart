import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides()
              ),
              _Dots(),
            ],
          )
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
          _Dot(),
          _Dot(),
          _Dot()
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric( horizontal: 5.0 ),
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
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
