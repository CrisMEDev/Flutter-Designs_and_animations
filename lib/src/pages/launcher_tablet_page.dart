import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgrounds_custom_painter/src/routes/routes.dart';
import 'package:backgrounds_custom_painter/src/theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.currentTheme.backgroundColor,
          title: Text('Diseños en flutter - Tablet'),
        ),

        drawer: _MenuLateral(),

        body: _ListaOpciones()
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider( color: appTheme.primaryColorLight, ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon( pageRoutes[i].icon, color: appTheme.accentColor, ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon( Icons.chevron_right, color: appTheme.accentColor, ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}


class _MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ThemeChanger temaProvider = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: temaProvider.currentTheme.accentColor,
                child: Text('CM', style: TextStyle( fontSize: 50.0 ),),
              ),
            ),

            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: temaProvider.currentTheme.accentColor, ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: temaProvider.currentTheme.accentColor,
                value: temaProvider.darkTheme,
                onChanged: (switchDM) => temaProvider.darkTheme = switchDM
              ),
            ),

            Divider(),

            ListTile(
              leading: Icon( Icons.add_to_home_screen, color: temaProvider.currentTheme.accentColor, ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: temaProvider.currentTheme.accentColor,
                value: temaProvider.customTheme,
                onChanged: (switchLM) => temaProvider.customTheme = switchLM
              ),
            ),


          ],
        ),
      ),
    );
  }
}
