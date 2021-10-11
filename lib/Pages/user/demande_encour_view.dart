import 'package:bhs/Pages/loading/loading.dart';
import 'package:bhs/Pages/user/detail_demande_encours.dart';
import 'package:bhs/models/acte.dart';
import 'package:bhs/models/user.dart';
import 'package:bhs/providers/acte_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemandeEnCours extends StatefulWidget {
  static String rootName = "/demande_encours";
  final User user;

  DemandeEnCours({Key key, this.user}) : super(key: key);

  @override
  _DemandeEnCoursState createState() => _DemandeEnCoursState();
}

class _DemandeEnCoursState extends State<DemandeEnCours> {
  ListActe listActes = ListActe();
  User user;

  void initState() {
    listActes.data = <Acte>[];
    super.initState();
  }

  Future<List<Acte>> getActeEncoursByUserId(int id) async {
    var data = await Provider.of<ActeApiProvider>(context, listen: false)
        .GetActeEncourByUserId(id);
    listActes = data;
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demande En cours"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<Acte>> listActes) {
        if (!listActes.hasData) {
          return Container(
            child: Center(child: Loading()),
          );
        }
        return ListView.builder(
          itemCount: listActes.data.length,
          itemBuilder: (context, index) {
            return getCard(listActes.data[index]);
          },
        );
      },
      future: getActeEncoursByUserId(widget.user.id),
    );
  }

  Widget getCard(Acte acte) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailDemandeEncours(
              user: widget.user,
              acte: acte,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 10,
        child: Row(
          children: [
            Image.asset(
              "assets/logo.jpg",
              width: 100,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Acte N*ML00 ${acte.id}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${acte.user?.firstName}  ${acte.user?.lastName}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "En cours de traitement . . .",
                    style: TextStyle(fontSize: 18.0, color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
