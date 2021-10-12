import 'package:bhs/models/acte.dart';
import 'package:bhs/models/user.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../mobile.dart';

class DetailDemandeTraites extends StatefulWidget {
  static String rootName = "/detailsDemandeTraites";

  final User user;
  final Acte acte;

  const DetailDemandeTraites({Key key, this.user, this.acte}) : super(key: key);

  @override
  _DetailDemandeTraitesState createState() => _DetailDemandeTraitesState();
}

class _DetailDemandeTraitesState extends State<DetailDemandeTraites> {
  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];

    header.cells[0].value = 'Acte';
    header.cells[1].value = 'N* 00' + widget.acte.id.toString();

    PdfGridRow row1 = grid.rows.add();

    row1.cells[0].value = 'Nom';
    row1.cells[1].value = widget.acte.lastName;
    PdfGridRow row2 = grid.rows.add();

    row2.cells[0].value = 'Prenom';
    row2.cells[1].value = widget.acte.firstName;
    PdfGridRow row3 = grid.rows.add();

    row3.cells[0].value = 'Date de naissance';
    row3.cells[1].value = widget.acte.dateBorn;
    PdfGridRow row4 = grid.rows.add();

    row4.cells[0].value = 'Adresse';
    row4.cells[1].value = widget.acte.address;
    PdfGridRow row5 = grid.rows.add();

    row5.cells[0].value = 'Nom du Pere';
    row5.cells[1].value = widget.acte.lastNameFather;
    PdfGridRow row6 = grid.rows.add();

    row6.cells[0].value = 'Prenom du Pere';
    row6.cells[1].value = widget.acte.firstNameFather;
    PdfGridRow row7 = grid.rows.add();

    row7.cells[0].value = 'Profession du Pere';
    row7.cells[1].value = widget.acte.fatherJob;
    PdfGridRow row8 = grid.rows.add();

    row8.cells[0].value = 'Nom de la Mere';
    row8.cells[1].value = widget.acte.lastNameMother;
    PdfGridRow row9 = grid.rows.add();

    row9.cells[0].value = 'Prenom de la Mere';
    row9.cells[1].value = widget.acte.firstNameMother;
    PdfGridRow row10 = grid.rows.add();

    row10.cells[0].value = 'Profession de la mere';
    row10.cells[1].value = widget.acte.motherJob;
    PdfGridRow row11 = grid.rows.add();

    row11.cells[0].value = 'Commune';
    row11.cells[1].value = widget.acte.commune;

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'acte.pdf');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail du Acte N°0ML " + widget.acte.id.toString()),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.picture_as_pdf,
                color: Colors.green,
                size: 30.8,
              ),
              onPressed: _createPDF,
            )
          ],
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
