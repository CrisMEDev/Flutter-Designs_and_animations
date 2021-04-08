import 'package:flutter/material.dart';

import 'package:backgrounds_custom_painter/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: Slideshow(
                dotsLocation: true,
                dotPrimaryColor: Colors.red,
                dotSecondaryColor: Colors.black,
                dotPrimarySize: 14.0,
                dotSecondarySize: 10.0,
                slides: [
                  SvgPicture.asset('assets/svg/slide-1.svg'),
                  SvgPicture.asset('assets/svg/slide-2.svg'),
                  SvgPicture.asset('assets/svg/slide-3.svg'),
                  SvgPicture.asset('assets/svg/slide-4.svg'),
                  SvgPicture.asset('assets/svg/slide-5.svg'),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Slideshow(
                dotPrimaryColor: Colors.red,
                dotSecondaryColor: Colors.black,
                dotPrimarySize: 14.0,
                dotSecondarySize: 10.0,
                slides: [
                  SvgPicture.asset('assets/svg/slide-5.svg'),
                  SvgPicture.asset('assets/svg/slide-4.svg'),
                  SvgPicture.asset('assets/svg/slide-3.svg'),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
