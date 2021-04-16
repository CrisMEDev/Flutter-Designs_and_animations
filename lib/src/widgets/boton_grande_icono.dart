import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGrandeIcono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        _BotonGrandeBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox( height: size.height * 0.18, width: size.width * 0.10, ),
            FaIcon( FontAwesomeIcons.carCrash, color: Colors.white, size: 40.0, ),
            SizedBox( width: size.width * 0.05, ),
            Expanded(child: Text('Motor accident', style: TextStyle( color: Colors.white, fontSize: 18.0 ),)),
            FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white, ),
            SizedBox( width: size.width * 0.10, )
          ],
        ),
      ],
    );
  }
}

class _BotonGrandeBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),

        child: Stack(
          children: [
            Positioned(
              right: -20.0,
              top: -20.0,
              child: FaIcon( FontAwesomeIcons.carCrash, size: 150, color: Colors.white.withOpacity(0.2), ),
            )
          ],
        ),
      ),

      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.13,
      margin: EdgeInsets.symmetric( horizontal: 15.0, vertical: 20.0 ),

      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow( color: Colors.black45.withOpacity(0.3), offset: Offset(4, 6), blurRadius: 10.0 )
        ],

        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFF6989F5),
            Color(0xFF906EF5),
          ]
        ) 
      ),
    );
  }
}