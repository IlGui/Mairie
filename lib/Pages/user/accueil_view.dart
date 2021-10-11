import 'package:bhs/models/user.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  static String rootName = "/accueil";
  final User user;
  const Accueil({Key key, this.user}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Center(
        child: Text(
          "ACCUEIL",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
