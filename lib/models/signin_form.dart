import 'package:flutter/material.dart';

class SigninForm {
  String phone;
  String password;
  SigninForm({this.phone, this.password});

  Map<String, dynamic> toJson() {
    return {
      'phone': this.phone,
      'password': this.password,
    };
  }
}
