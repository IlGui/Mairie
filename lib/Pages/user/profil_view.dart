import 'package:bhs/models/user.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  static String rootName = "/profil";
  final User user;
  const Profil({Key key, this.user}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OGII: Profil",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
              Text(
                " ${widget.user.firstName} ${widget.user.lastName}",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                ),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  color: Colors.red[400],
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
