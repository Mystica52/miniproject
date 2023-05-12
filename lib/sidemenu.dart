import 'package:flutter/material.dart';

class sidemenu extends StatefulWidget {
  @override
  _sidemenu createState() => new _sidemenu();
}

class _sidemenu extends State<sidemenu> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sidemenu'),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Cohort'),
              accountEmail: new Text('abc@alueducation.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://i.pravatar.cc/300'),
              ),
            ),
            new ListTile(
              title: new Text('About Page'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
