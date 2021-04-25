import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:backgrounds_custom_painter/src/theme/theme.dart';
import 'package:backgrounds_custom_painter/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final temaProvider = Provider.of<ThemeChanger>(context);

    bool isLarge;
    (MediaQuery.of(context).size.height > 500) ? isLarge = true : isLarge = false;

    final children = [
            Expanded(
              flex: 7,
              child: Slideshow(
                dotsLocation: true,
                dotPrimaryColor: (!temaProvider.darkTheme) ? temaProvider.currentTheme.accentColor : Colors.red,
                dotSecondaryColor: (!temaProvider.darkTheme) ? temaProvider.currentTheme.primaryColorLight : Colors.black,
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
                dotPrimaryColor: (!temaProvider.darkTheme) ? temaProvider.currentTheme.accentColor : Colors.red,
                dotSecondaryColor: (!temaProvider.darkTheme) ? temaProvider.currentTheme.primaryColorLight : Colors.black,
                dotPrimarySize: 14.0,
                dotSecondarySize: 10.0,
                slides: [
                  SvgPicture.asset('assets/svg/slide-5.svg'),
                  SvgPicture.asset('assets/svg/slide-4.svg'),
                  SvgPicture.asset('assets/svg/slide-3.svg'),
                ],
              ),
            )
          ];


    return SafeArea(
      child: Scaffold(
        backgroundColor: (!temaProvider.darkTheme) ? temaProvider.currentTheme.accentColor : Colors.purple[100],
        body: isLarge
              ? Column(
                children: children,
              )
              : Row(
                children: children,
              )
      ),
    );
  }
}
