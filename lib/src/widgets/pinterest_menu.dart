import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({ 
    @required this.onPressed,
    @required this.icon
  });
}

class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon:  Icons.pie_chart, onPressed: (){ print('Icon pie chart'); } ),
    PinterestButton(icon:  Icons.search, onPressed: (){ print('Icon search'); } ),
    PinterestButton(icon:  Icons.notifications, onPressed: (){ print('Icon notifications'); } ),
    PinterestButton(icon:  Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); } ),
  ];

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(

        child: _MenuItems( menuItems: items ),

        width: screenSize.width * 0.75,
        height: screenSize.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all( Radius.circular(50.0) ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(2, 2),
              blurRadius: 10.0,
              spreadRadius: -0.5
            )
          ]
        ),
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems({this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate( menuItems.length, (index) => _PinterestMenuButton( index, menuItems[index] ) )
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon( item.icon ),
    );
  }
}
