import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:backgrounds_custom_painter/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diseños en flutter'),
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

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider( color: Colors.blueGrey, ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon( pageRoutes[i].icon, color: Colors.blueGrey, ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon( Icons.chevron_right, color: Colors.blueGrey, ),
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
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: Colors.cyan[300],
                child: Text('CM', style: TextStyle( fontSize: 50.0 ),),
              ),
            ),

            Expanded(
              child: _ListaOpciones(),
            ),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: Colors.deepPurple[100], ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: Colors.blueGrey,
                value: true,
                onChanged: (switchDM) {}
              ),
            ),

            Divider(),

            ListTile(
              leading: Icon( Icons.add_to_home_screen, color: Colors.deepPurple[100], ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.blueGrey,
                value: true,
                onChanged: (switchLM) {}
              ),
            ),


          ],
        ),
      ),
    );
  }
}
