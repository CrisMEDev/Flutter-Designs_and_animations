import 'package:backgrounds_custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:backgrounds_custom_painter/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => new _MenuModel(),

        child: Scaffold(
          // body: PinterestMenu(),
          // body: _PinterestGrid(),
          body: Stack(
            children: [
              _PinterestGrid(),
              _PinterestMenuLocation()
            ],
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bool mostrarMenu = Provider.of<_MenuModel>(context).mostrar;
    final screenSize = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    double ancho;
    bool isLarge;

    if ( screenSize.width > 500 ){
      isLarge =  true;
      ancho = screenSize.width - (screenSize.width * 0.40);
    }
    else {
      isLarge = false;
      ancho = screenSize.width;
    }

    return Positioned(
      bottom: screenSize.height * 0.03,
      left: isLarge ? ancho / 10 : null,
      child: Container(
        width: ancho,
        child: Align(
          child: PinterestMenu(
            items: [
              PinterestButton(icon:  Icons.pie_chart, onPressed: (){ print('Icon pie chart'); } ),
              PinterestButton(icon:  Icons.search, onPressed: (){ print('Icon search'); } ),
              PinterestButton(icon:  Icons.notifications, onPressed: (){ print('Icon notifications'); } ),
              PinterestButton(icon:  Icons.supervised_user_circle, onPressed: (){ print('Icon supervised_user_circle'); } ),
            ],

            mostrar: mostrarMenu,
            activeColor: appTheme.accentColor,
            inactiveColor: appTheme.primaryColorLight,
            backgroundColor: appTheme.scaffoldBackgroundColor,
          ),
          alignment: Alignment.center,
        )
      )
    );
  }
}

class _PinterestGrid extends StatefulWidget {

  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0.0;

  @override
  void initState() { 
    controller.addListener(() {

      // print('Scroll listener ${ controller.offset } ');
      if ( controller.offset > scrollAnterior ){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;

    });
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int count;

    if ( MediaQuery.of(context).size.width > 500  ){
      count = 3;
    } else{
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,

      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem( index: index, ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  const _PinterestItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all( 1.0 ),

      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all( Radius.elliptical(50.0, 40.0) ),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      )
    );
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
       set mostrar( bool opacity ){
         this._mostrar = opacity;
         notifyListeners();
       }
}
