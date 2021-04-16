import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgrounds_custom_painter/src/widgets/boton_grande_icono.dart';
import 'package:backgrounds_custom_painter/src/widgets/headers.dart';

class _ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  _ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final items = <_ItemBoton>[
      new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new _ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new _ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new _ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new _ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    final List<Widget> itemMap = items.map((e) =>
      BotonGrandeIcono(
        icon: e.icon,
        texto: e.texto,
        onPress: (){},
        color1: e.color1,
        color2: e.color2,
      )
    ).toList();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox( height: MediaQuery.of(context).size.height * 0.35, ),
                ...itemMap   // Operador spread para separar cada uno de los elementos
              ],
            ),
            _Encabezado()
          ],
        ),
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'Has solicitado',
          color1: Color(0xff6189F5),
          color2: Color(0xff66A9F2),
        ),
        Positioned(
          right: -10.0,
          top: -5.0,
          
          child: RawMaterialButton(
            padding: EdgeInsets.all(20.0),
            shape: CircleBorder(),
            onPressed: (){},
            child: FaIcon( FontAwesomeIcons.ellipsisV, color: Colors.white, )
          ),
        )
      ],
    );
  }
}

class _BotonGrandeTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BotonGrandeIcono(
      icon: FontAwesomeIcons.carCrash,
      texto: 'Emergency alert',
      primaryColor: Colors.black54,
      onPress: (){},
    );
  }
}

class _PageHeader extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Has Solicitado',
      titulo: 'Asistencia Médica',
      color1: Color(0xff6189F5),
      color2: Color(0xff66A9F2),
    );
  }
}