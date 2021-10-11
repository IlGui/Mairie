import 'package:bhs/Pages/user/demande_encour_view.dart';
import 'package:bhs/Pages/user/demande_traite_view.dart';
import 'package:bhs/models/user.dart';

import 'package:flutter/material.dart';

class Demande extends StatefulWidget {
  static String rootName = "/demande";
  final User user;
  const Demande({Key key, this.user}) : super(key: key);

  @override
  _DemandeState createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des demandes"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DemandeEnCours(user: widget.user),
                ),
              );
            },
            leading: Icon(Icons.hourglass_top_outlined, size: 22),
            title: Text(
              'Demandes en cours',
              style: TextStyle(fontSize: 20.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right, size: 22),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DemandeTraite(
                    user: widget.user,
                  ),
                ),
              );
            },
            leading: Icon(Icons.hourglass_bottom, size: 22),
            title: Text(
              'Demandes traitées',
              style: TextStyle(fontSize: 20.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
