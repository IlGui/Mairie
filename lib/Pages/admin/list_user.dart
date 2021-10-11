import 'package:bhs/Pages/loading/loading.dart';
import 'package:bhs/models/acte.dart';
import 'package:bhs/models/user.dart';
import 'package:bhs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUserView extends StatefulWidget {
  static String rootName = "/listUser";
  final User user;

  final Acte acte;

  ListUserView({Key key, this.user, this.acte}) : super(key: key);

  @override
  _ListUserViewState createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  User user;
  Acte acte;
  ListUsers listUsers = ListUsers();
  @override
  void initState() {
    listUsers.data = <User>[];
    super.initState();
  }

  Future<List<User>> getUserList() async {
    var data =
        await Provider.of<UserProvider>(context, listen: false).getUserData();
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black54,
          title: Text('Liste des Utilisateurs'),
        ),
        body: Column(
          children: [
            Container(
              child: listUsers.data == null
                  ? Loading()
                  : FutureBuilder<List<User>>(
                      initialData: listUsers.data,
                      future: getUserList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<User>> snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        return ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              color: Colors.white,
                              //height: 130,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.all(1.2),
                                  child: FittedBox(
                                    child: DataTable(
                                      headingRowColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.grey),
                                      columns: [
                                        DataColumn(
                                          label: Text(
                                            "Nom",
                                            textScaleFactor: 2.0,
                                          ),
                                          tooltip: "nom",
                                          numeric: false,
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Prénom',
                                            textScaleFactor: 2.0,
                                          ),
                                          tooltip: "Prénom",
                                          numeric: false,
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Numero',
                                            textScaleFactor: 2.0,
                                          ),
                                          tooltip: "numero",
                                          numeric: false,
                                        ),
                                      ],
                                      rows: snapshot.data == null
                                          ? null
                                          : snapshot.data
                                              .map(
                                                (user) => DataRow(
                                                  onSelectChanged:
                                                      (bool selected) {
                                                    if (selected) {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(),
                                                      );
                                                    }
                                                  },
                                                  cells: [
                                                    DataCell(
                                                      //N* Vente
                                                      Text(user.firstName,
                                                          style: TextStyle(
                                                              fontSize: 40.0)),
                                                    ),
                                                    DataCell(
                                                      //Quantité
                                                      Text(
                                                        user.lastName,
                                                        style: TextStyle(
                                                            fontSize: 40.0),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      //Date de Commande
                                                      Text(
                                                        user.phone,
                                                        style: TextStyle(
                                                            fontSize: 40.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                    ),
                                  )),
                            ),
                          ],
                        );
                      }),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
