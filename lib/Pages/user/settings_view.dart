import 'package:bhs/Pages/auth/login_view_screen.dart';
import 'package:bhs/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  static String rootName = "/settings";
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> logout() async {
    final bool logout =
        await Provider.of<AuthProvider>(context, listen: false).logout();

    if (logout) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else {
      //affiche messge
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.orange[900],
                size: 30,
              ),
              title: Text(
                'Deconnexion',
                style: TextStyle(fontSize: 20),
              ),
              onTap: logout,
            ),
            ListTile(
              leading: Icon(
                Icons.outbond_rounded,
                color: Colors.orange[900],
                size: 30,
              ),
              title: Text(
                'Version',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                "1.0.0",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
