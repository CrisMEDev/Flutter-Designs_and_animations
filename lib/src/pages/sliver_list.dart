import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _Titulo()
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric( horizontal: 30.0, vertical: 20.0 ),
          child: Text('New', style: TextStyle( color: Color(0xFF532128), fontSize: 50.0 )),
        ),

        Stack(
          children: [

            SizedBox( width: screenSize.width * 0.22, ),

            Positioned(
              bottom: 8.0,
              child: Container(
                width: 120.0,
                height: 8.0,
                color: Color(0xFFF7CDD5),
              ),
            ),

            Container(
              child: Text('List', style: TextStyle( color: Color(0xFFD93A30), fontSize: 50.0, fontWeight: FontWeight.bold ),),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListaDeActividades extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) => _ListItem(),
    );
  }
}

class _ListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(30.0),
      alignment: Alignment.centerLeft,
      child: Text('data', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0 ),),

      height: screenSize.height * 0.12,
      width: screenSize.width,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30.0)
      ),
    );
  }
}