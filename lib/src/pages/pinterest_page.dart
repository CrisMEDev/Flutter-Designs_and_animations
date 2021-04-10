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

    return Positioned(
      bottom: screenSize.height * 0.03,
      child: Container(
        width: screenSize.width,
        child: Align(
          child: PinterestMenu( mostrar: mostrarMenu, ),
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
    return StaggeredGridView.countBuilder(
      controller: controller,

      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem( index: index, ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 4),
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
