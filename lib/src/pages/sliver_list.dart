import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _MainScroll()
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( nombreColor: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( nombreColor: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( nombreColor: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( nombreColor: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem( nombreColor: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( nombreColor: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( nombreColor: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( nombreColor: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem( nombreColor: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( nombreColor: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( nombreColor: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( nombreColor: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem( nombreColor: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( nombreColor: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( nombreColor: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( nombreColor: 'Books', color: Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        // SliverAppBar(
        //   floating: true,
        //   forceElevated: true,

        //   title: Text('Hola mundo'),
        //   backgroundColor: Colors.red,
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _PersonalSliverCustomHeaderDelegate(
            maxHeight: 200.0,
            minHeight: 170.0,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo(),
            )
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox( height: MediaQuery.of(context).size.height * 0.20, )
          ]),
        )

      ],
    );
  }
}

class _PersonalSliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight, maxHeight;
  final Widget child;

  _PersonalSliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => ( minHeight > maxHeight ) ? minHeight : maxHeight;

  @override
  double get minExtent => ( minHeight < maxHeight ) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(covariant _PersonalSliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child     != oldDelegate.child;
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

  final items = [
    _ListItem( nombreColor: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( nombreColor: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( nombreColor: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( nombreColor: 'Books', color: Color(0xffFCEBAF) ),
    _ListItem( nombreColor: 'Orange', color: Color(0xffF08F66) ),
    _ListItem( nombreColor: 'Family', color: Color(0xffF2A38A) ),
    _ListItem( nombreColor: 'Subscriptions', color: Color(0xffF7CDD5) ),
    _ListItem( nombreColor: 'Books', color: Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {

  final String nombreColor;
  final Color color;
  
  const _ListItem({this.nombreColor, this.color});
  
  @override
  Widget build(BuildContext context) {

  final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(30.0),
      alignment: Alignment.centerLeft,
      child: Text(this.nombreColor, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0 ),),

      height: screenSize.height * 0.12,
      width: screenSize.width,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30.0)
      ),
    );
  }
}