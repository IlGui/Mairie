import 'package:bhs/Pages/user/accueil_view.dart';
import 'package:bhs/Pages/user/demande_view.dart';
import 'package:bhs/Pages/user/form_demande.dart';
import 'package:bhs/Pages/user/profil_view.dart';
import 'package:bhs/Pages/user/settings_view.dart';
import 'package:bhs/models/user.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  static String rootName = "/menu_user";
  final User user;
  const Menu({Key key, this.user}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currentTab = 0;
  final List<Widget> screens = [Profil(), Accueil(), Demande(), Settings()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Accueil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FormDemande(
              user: widget.user,
            ),
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Accueil(user: widget.user);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.nat_sharp,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Accueil",
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? Colors.blue : Colors.green),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Demande(user: widget.user);
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Demande",
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue : Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // Right tab Bar
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profil(user: widget.user);
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue : Colors.green),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Settings();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue : Colors.green),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
