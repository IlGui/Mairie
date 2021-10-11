import 'package:bhs/Pages/auth/login_view_screen.dart';
import 'package:bhs/models/user.dart';
import 'package:bhs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  static String rootName = "/register";
  static String tag = 'register-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  User user;

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  FormState get form => key.currentState;
  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confPasswordController = new TextEditingController();

  @override
  void initState() {
    user = User(
      id: null,
      firstName: null,
      lastName: null,
      email: null,
      password: null,
      passwordConfirmed: null,
      phone: null,
      roleId: null,
      state: null,
    );

    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();

      user.firstName = _prenomController.text;
      user.lastName = _nomController.text;
      user.email = _emailController.text;
      user.phone = _phoneController.text;
      user.roleId = 1;
      user.password = _passwordController.text;
      user.passwordConfirmed = _confPasswordController.text;
      if (user.password != user.passwordConfirmed) {
        Toast.show("Password et Password Confirmation Different", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Colors.red);
        setState(() {
          _passwordController.text = "";
          _passwordController.clear();
          _confPasswordController.text = "";
          _confPasswordController.clear();
        });
      } else {
        final User responseUser =
            await Provider.of<UserProvider>(context, listen: false)
                .addDataUser(user);

        if (responseUser != null) {
          Toast.show("User ajouté avec succes", context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.TOP,
              backgroundColor: Colors.green);
        } else {
          Toast.show("User add Error", context,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.TOP,
              backgroundColor: Colors.green);
        }
        setState(() {
          form.reset();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "email is required";
        }
      },
    );
    final firstname = TextFormField(
      controller: _prenomController,
      keyboardType: TextInputType.text,
      autofocus: false,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'FirstName',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "firstname is required";
        }
      },
    );
    final phone = TextFormField(
      controller: _phoneController,
      maxLength: 8,
      keyboardType: TextInputType.phone,
      autofocus: false,
      validator: (value) {
        if (value.isEmpty || value.length != 8) {
          return 'numero Obligatoire et 8 chiffres';
        }
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Phone',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final lastname = TextFormField(
      controller: _nomController,
      keyboardType: TextInputType.text,
      autofocus: false,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'LastName',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "lastname is required";
        }
      },
    );

    final password = TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.number,
      maxLength: 4,
      autofocus: false,
      obscureText: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty || value.length != 4) {
          return 'Password obligatoire et a 4 chiffres';
        }
      },
    );
    final Confirmedpassword = TextFormField(
      controller: _confPasswordController,
      keyboardType: TextInputType.number,
      maxLength: 4,
      autofocus: false,
      obscureText: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Confirmed Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty || value.length != 4) {
          return 'Confirmed Password obligatoire et a 4 chiffres';
        }
      },
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
        child: Text('Enregistrer', style: TextStyle(color: Colors.white)),
      ),
    );

    final loginPage = FlatButton(
      child: Text(
        'j\'ai déjá un compte !',
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    final titlePage = FlatButton(
      child: Text(
        "Création d' un compte",
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
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
              titlePage,
              SizedBox(height: 20.0),
              firstname,
              SizedBox(height: 20.0),
              lastname,
              SizedBox(height: 20.0),
              phone,
              SizedBox(height: 20.0),
              email,
              SizedBox(height: 20.0),
              password,
              SizedBox(height: 10.0),
              Confirmedpassword,
              SizedBox(height: 24.0),
              loginButton,
              loginPage
            ],
          ),
        ),
      ),
    );
  }
}
