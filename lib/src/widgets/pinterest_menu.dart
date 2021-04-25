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

  final bool mostrar;
  final List<PinterestButton> items;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),

      child: AnimatedOpacity(
        opacity: mostrar ? 1.0 : 0.0,
        duration: Duration( milliseconds: 250 ),
        curve: Curves.easeIn,

        child: Visibility(    // Se agrega este widget para que no se pueda interactuar con el menu
          visible: mostrar,
          maintainState: true,      // NOTA: Si se desea mantener la animacion se debe mantener el estado tambien, esto
          maintainAnimation: true,  // tiene un costo de memoria elevado.
          child: Builder(
            builder: ( BuildContext context ){

              final menuModel = Provider.of<_MenuModel>(context);
              menuModel.backgroundColor = this.backgroundColor;
              menuModel.inactiveColor = this.inactiveColor;
              menuModel.activeColor = this.activeColor;

              return _PinterestMenuBackground(
                child: _MenuItems( menuItems: items, ),
              );
            }
          )
        ),
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
    final menuModel = Provider.of<_MenuModel>(context);
    bool isLarge;

    ( screenSize.width > screenSize.height ) ? isLarge = true : isLarge = false;

    return Container(
      
      child: this.child,

      width: isLarge ? screenSize.height * 0.75 : screenSize.width * 0.75,
      height: isLarge ? screenSize.width * 0.08 : screenSize.height * 0.08,
      decoration: BoxDecoration(
        color: menuModel.backgroundColor,
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

    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,  // Para el caso que en algunos dispositivos el onTap no funcione bien

      child: Container(
        child: Icon(
          item.icon,
          size: ( menuModel.itemSeleccionado == index ) ? 32.0 : 28.0,
          color: ( menuModel.itemSeleccionado == index ) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  
  int _itemSeleecionado  = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor     = Colors.black;
  Color _inactiveColor   = Colors.blueGrey;


  int get itemSeleccionado => this._itemSeleecionado;
      set itemSeleccionado( int item ){
        this._itemSeleecionado = item;
        notifyListeners();
      }

  Color get backgroundColor => _backgroundColor;

        set backgroundColor(Color backgroundColor) {
          this._backgroundColor = backgroundColor;
        }

  Color get activeColor => _activeColor;

        set activeColor(Color activeColor) {
          this._activeColor = activeColor;
        }

  Color get inactiveColor => _inactiveColor;

        set inactiveColor(Color inactiveColor) {
          this._inactiveColor = inactiveColor;
        }

}
