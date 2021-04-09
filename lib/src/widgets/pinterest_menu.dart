import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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


    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),

      child: _PinterestMenuBackground(
        child: _MenuItems( menuItems: items, ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;

  const _PinterestMenuBackground({ @required this.child});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Container(
      
      child: this.child,

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

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,  // Para el caso que en algunos dispositivos el onTap no funcione bien

      child: Container(
        child: Icon(
          item.icon,
          size: ( itemSeleccionado == index ) ? 32.0 : 28.0,
          color: ( itemSeleccionado == index ) ? Colors.red[200] : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  
  int _itemSeleecionado = 0;

  int get itemSeleccionado => this._itemSeleecionado;
      set itemSeleccionado( int item ){
        this._itemSeleecionado = item;
        notifyListeners();
      }

}
