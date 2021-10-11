import 'package:bhs/models/acte.dart';
import 'package:bhs/models/user.dart';

import 'package:flutter/material.dart';

class DetailDemandeTraitesAdmin extends StatefulWidget {
  static String rootName = "/detailsDemandeTraitesAdmin";

  final User user;
  final Acte acte;

  const DetailDemandeTraitesAdmin({Key key, this.user, this.acte})
      : super(key: key);

  @override
  _DetailDemandeTraitesAdminState createState() =>
      _DetailDemandeTraitesAdminState();
}

class _DetailDemandeTraitesAdminState extends State<DetailDemandeTraitesAdmin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail du Acte N°0ML " + widget.acte.id.toString()),
          backgroundColor: Colors.black54,
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
