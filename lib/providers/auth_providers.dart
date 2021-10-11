import 'package:bhs/models/responses/response_generic.dart';
import 'package:bhs/models/responses/response_login.dart';
import 'package:bhs/models/signin_form.dart';
import 'package:bhs/models/user.dart';
import 'package:bhs/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  String token = "";
  final FlutterSecureStorage storage = FlutterSecureStorage();
  bool isLoggedin = false;
  User user;

  Future<void> initAuth() async {
    try {
      String oldToken = await storage.read(key: 'token');
      if (oldToken == null) {
        isLoggedin = false;
        notifyListeners();
      } else {
        token = oldToken;
        isLoggedin = true;
        user = await fetchCurrentUser();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseLogin> signin(SigninForm signinForm) async {
    try {
      isLoggedin = true;
      ResponseGeneric responseGeneric =
          await ApiService.postAction(signinForm, "auth/login", "");
      final ResponseLogin responseLogin =
          ResponseLogin.fromJson(responseGeneric.data);
      token = responseLogin.token;
      isLoggedin = true;
      storage.write(key: 'token', value: token);
      user = await fetchCurrentUser();
      notifyListeners();
      return responseLogin;
    } catch (e) {
      print(e);
      isLoading = false;
      rethrow;
    }
  }

  Future<User> fetchCurrentUser() async {
    try {
      ResponseGeneric response = await ApiService.getAction("auth/me", token);
      // final ResponseLogin responseLogin = ResponseLogin.fromJson(responseGeneric.data);
      if (response != null) {
        // updateUser(User.fromJson(response.data));
        return User.fromJson(response.data);
      } else {
        throw Exception('error status code');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    ResponseGeneric response =
        await ApiService.postActionWithoutBody("auth/logout", token);

    if (response.message == "Tokens Revoked") {
      isLoggedin = false;

      storage.delete(key: "token");
      notifyListeners();
      return true;
    } else {
      throw Exception('error status code');
    }
  }
}
