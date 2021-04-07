import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final String assetName = 'assets/svg/slide-1.svg';
  final Widget svg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Logo'
  );

    return Scaffold(
      body: Center(
        child: svg,
      ),
    );
  }
}
