import 'package:bhs/Pages/admin/dashbord.dart';
import 'package:bhs/models/acte.dart';
import 'package:bhs/models/user.dart';
import 'package:bhs/providers/acte_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class DetailDemandeEncoursAdmin extends StatefulWidget {
  static String rootName = "/detailsDemandeEncoursAdmin";

  final User user;
  final Acte acte;

  const DetailDemandeEncoursAdmin({Key key, this.user, this.acte})
      : super(key: key);

  @override
  _DetailDemandeEncoursAdminState createState() =>
      _DetailDemandeEncoursAdminState();
}

class _DetailDemandeEncoursAdminState extends State<DetailDemandeEncoursAdmin> {
  Future<void> changeState() async {
    Acte acte = Acte();
    acte.firstName = widget.acte.firstName;
    acte.user_id = widget.acte.user_id;
    acte.lastName = widget.acte.lastName;
    acte.firstNameFather = widget.acte.firstNameFather;
    acte.lastNameFather = widget.acte.lastNameFather;

    acte.firstNameMother = widget.acte.firstNameMother;
    acte.lastNameMother = widget.acte.lastNameMother;
    acte.address = widget.acte.address;
    acte.motherJob = widget.acte.motherJob;
    acte.fatherJob = widget.acte.fatherJob;
    acte.dateBorn = widget.acte.dateBorn;
    acte.commune = widget.acte.commune;

    final Acte responseActe =
        await Provider.of<ActeApiProvider>(context, listen: false)
            .updateActe(widget.acte.id, acte);

    if (responseActe != null) {
      Toast.show("Acte statut mise a jour avec succes", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM,
          backgroundColor: Colors.green);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DashboardAdmin(
            user: widget.user,
          ),
        ),
      );
    } else {
      setState(() {
        //message = "Erreur produite lors de l'enregistrement";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail du Acte N°00ML  " + widget.acte.id.toString()),
          backgroundColor: Colors.black54,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.update,
                color: Colors.white,
                size: 30.8,
              ),
              onPressed: changeState,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "Nom",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 200,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.firstName,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 200,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.lastName,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Date de Naissance ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.dateBorn,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Commune ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.commune,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Adresse ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.address,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Nom du Pere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.lastNameFather,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom du Pere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.firstNameFather,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Proffession du Pere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.fatherJob,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Nom de la Mere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.lastNameMother,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Prenom de la mere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.firstNameMother,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Proffession de la mere ",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 190,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Expanded(
                                            child: Row(children: <Widget>[
                                          Spacer(),
                                          Text(widget.acte.motherJob,
                                              style: TextStyle(
                                                color: Colors.green[700],
                                                fontSize: 18,
                                              )),
                                        ])),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget lineSection = Container(
  color: Colors.grey[200],
  padding: EdgeInsets.all(4),
);
