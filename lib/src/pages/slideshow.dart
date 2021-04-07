import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _Slides(),
        ),
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        physics: ScrollPhysics(), // Elimina la animación azul presentada en android cuando no hay mas contenido
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
