import 'package:bhs/Pages/auth/forgot_password.dart';
import 'package:bhs/Pages/auth/register_view.dart';
import 'package:bhs/Pages/splash_view.dart';
import 'package:bhs/models/responses/response_login.dart';
import 'package:bhs/models/signin_form.dart';
import 'package:bhs/providers/auth_providers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  static String rootName = "/login";
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  SigninForm signinForm;
  bool hiddenpwd = true;
  String message = "";
  @override
  void initState() {
    signinForm = SigninForm(phone: "", password: "");
    super.initState();
  }

  FormState get form => key.currentState;

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final ResponseLogin responseLogin =
          await Provider.of<AuthProvider>(context, listen: false)
              .signin(signinForm);
      if (responseLogin != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SplashView(),
          ),
        );
      } else {
        setState(() {
          message = "Login or Password Incorrect";
        });
        Toast.show("Login or Password Incorrect", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.red);
      }
      // Provider.of<UserProvider>(context, listen: false).updateUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.jpg'),
      ),
    );

    final phone = TextFormField(
      maxLength: 8,
      keyboardType: TextInputType.phone,
      autofocus: false,
      onSaved: (value) {
        signinForm.phone = value.toString();
      },
      validator: (value) {
        if (value.isEmpty || value.length != 8) {
          return 'numero Obligatoire et 8 chiffres';
        }
      },
      initialValue: '',
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Phone',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: '',
      obscureText: true,
      cursorColor: Colors.white,
      onSaved: (value) {
        signinForm.password = value.toString();
      },
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          icon: hiddenpwd
              ? Icon(
                  Icons.visibility,
                  color: Colors.indigo[400],
                )
              : Icon(
                  Icons.visibility_off,
                  color: Colors.indigo[400],
                ),
          onPressed: () {
            setState(() {
              hiddenpwd = !hiddenpwd;
            });
          },
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: submitForm,
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Se connecter', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password ?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ForgetPassword()));
      },
    );

    final registerLabel = FlatButton(
      child: Text(
        'Créer un compte ?',
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterPage()));
      },
    );

    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Center(
        child: Form(
          key: key,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              phone,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel,
              registerLabel
            ],
          ),
        ),
      ),
    );
  }
}
