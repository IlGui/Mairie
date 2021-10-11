import 'package:bhs/Pages/acte/list_acte_view.dart';
import 'package:bhs/Pages/admin/dashbord.dart';
import 'package:bhs/Pages/admin/deamnde_encours_admin_view.dart';
import 'package:bhs/Pages/admin/details_demande_encours_admin.dart';
import 'package:bhs/Pages/admin/list_user.dart';
import 'package:bhs/Pages/auth/forgot_password.dart';
import 'package:bhs/Pages/auth/login_view_screen.dart';
import 'package:bhs/Pages/auth/register_view.dart';
import 'package:bhs/Pages/home_view.dart';
import 'package:bhs/Pages/not_found.dart';
import 'package:bhs/Pages/splash_view.dart';
import 'package:bhs/Pages/user/accueil_view.dart';
import 'package:bhs/Pages/user/demande_encour_view.dart';
import 'package:bhs/Pages/user/demande_traite_view.dart';
import 'package:bhs/Pages/user/demande_view.dart';
import 'package:bhs/Pages/user/detail_demande_encours.dart';
import 'package:bhs/Pages/user/details_demande_traite.dart';
import 'package:bhs/Pages/user/form_demande.dart';
import 'package:bhs/Pages/user/profil_view.dart';
import 'package:bhs/constants.dart';
import 'package:bhs/providers/acte_provider.dart';
import 'package:bhs/providers/auth_providers.dart';
import 'package:bhs/providers/user_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MairieApp());
}

class MairieApp extends StatefulWidget {
  @override
  _OgiiState createState() => _OgiiState();
}

class _OgiiState extends State<MairieApp> {
  final AuthProvider authProvider = AuthProvider();
  final ActeApiProvider acteApiProvider = ActeApiProvider();
  final UserProvider userProvider = UserProvider();
  @override
  void initState() {
    initauthAsync().then((value) => {});
    super.initState();
  }

  Future<void> initauthAsync() async {
    await authProvider.initAuth();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: authProvider,
        ),
        ChangeNotifierProxyProvider<AuthProvider, ActeApiProvider>(
            create: (_) => ActeApiProvider(),
            update: (_, authProvider, oldActeProvider) {
              oldActeProvider.update(authProvider);
              return oldActeProvider;
            }),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
            create: (_) => UserProvider(),
            update: (_, authProvider, oldUserProvider) {
              oldUserProvider.update(authProvider);
              return oldUserProvider;
            }),
      ],
      child: MaterialApp(
        title: 'OGII Mairie',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: SplashView(),
        onGenerateRoute: (settings) {
          if (settings.name == LoginPage.rootName) {
            return MaterialPageRoute(builder: (_) => LoginPage());
          } else if (settings.name == HomeViewScreen.rootName) {
            return MaterialPageRoute(builder: (_) => HomeViewScreen());
          } else if (settings.name == ListActeView.rootName) {
            return MaterialPageRoute(builder: (_) => ListActeView());
          } else if (settings.name == Accueil.rootName) {
            return MaterialPageRoute(builder: (_) => Accueil());
          } else if (settings.name == Demande.rootName) {
            return MaterialPageRoute(builder: (_) => Demande());
          } else if (settings.name == Profil.rootName) {
            return MaterialPageRoute(builder: (_) => Profil());
          } else if (settings.name == FormDemande.rootName) {
            return MaterialPageRoute(builder: (_) => FormDemande());
          } else if (settings.name == ForgetPassword.rootName) {
            return MaterialPageRoute(builder: (_) => ForgetPassword());
          } else if (settings.name == RegisterPage.rootName) {
            return MaterialPageRoute(builder: (_) => RegisterPage());
          } else if (settings.name == DemandeEnCours.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeEnCours());
          } else if (settings.name == DemandeTraite.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeTraite());
          } else if (settings.name == DetailDemandeEncours.rootName) {
            return MaterialPageRoute(builder: (_) => DetailDemandeEncours());
          } else if (settings.name == DetailDemandeTraites.rootName) {
            return MaterialPageRoute(builder: (_) => DetailDemandeTraites());
          } else if (settings.name == DashboardAdmin.rootName) {
            return MaterialPageRoute(builder: (_) => DashboardAdmin());
          } else if (settings.name == DemandeEncoursAdmin.rootName) {
            return MaterialPageRoute(builder: (_) => DemandeEncoursAdmin());
          } else if (settings.name == ListUserView.rootName) {
            return MaterialPageRoute(builder: (_) => ListUserView());
          } else if (settings.name == DetailDemandeEncoursAdmin.rootName) {
            return MaterialPageRoute(
                builder: (_) => DetailDemandeEncoursAdmin());
          }

          return null;
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => NotFoundView(),
        ),
      ),
    );
  }
}


/* class MairieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OGII MAIRIE',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: LoginPage(),
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeViewScreen());
      case '/forgot_password':
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case '/dashboard':
        return MaterialPageRoute(builder: (context) => MainScreen());
      case '/menu_user':
        return MaterialPageRoute(builder: (context) => Menu());
      case '/form_demande':
        return MaterialPageRoute(builder: (context) => FormDemande());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                appBar: AppBar(title: Text("Error"), centerTitle: true),
                body: Center(
                  child: Text("Page not found"),
                )));
    }
  }
} */
