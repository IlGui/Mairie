import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  static String rootName = "/forget_password";
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Text(
          "forget Password ?",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
