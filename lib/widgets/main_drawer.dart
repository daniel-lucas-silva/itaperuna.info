import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Inicio"),
            onTap: () => print('home'),
          ),
          Divider()
        ],
      ),
    );
  }
}
