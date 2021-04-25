import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGrandeIcono extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1, color2, primaryColor;
  final Function onPress;

  const BotonGrandeIcono({
    this.icon   = Icons.adb,
    @required this.texto,
    this.color1 = Colors.greenAccent,
    this.color2 = Colors.blueGrey,
    this.primaryColor = Colors.white,
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => {
        print('Soy un botón'),
        this.onPress(),
      },
      child: Stack(
        children: [
          _BotonGrandeBackground(
            color1: this.color1,
            color2: this.color2,
            icon: this.icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox( height: size.height * 0.20, width: size.width * 0.10, ),
              FaIcon( this.icon, color: this.primaryColor, size: 40.0, ),
              SizedBox( width: size.width * 0.05, ),
              Expanded(child: Text(this.texto, style: TextStyle( color: Colors.white, fontSize: 18.0 ),)),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox( width: size.width * 0.10, )
            ],
          ),
        ],
      ),
    );
  }
}

class _BotonGrandeBackground extends StatelessWidget {

  final Color color1, color2;
  final IconData icon;

  const _BotonGrandeBackground({this.color1, this.color2, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),

        child: Stack(
          children: [
            Positioned(
              right: -20.0,
              top: -20.0,
              child: FaIcon( this.icon, size: 150, color: Colors.white.withOpacity(0.2), ),
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
            this.color1,
            this.color2,
          ]
        ) 
      ),
    );
  }
}