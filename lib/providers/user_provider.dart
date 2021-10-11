import 'package:bhs/models/responses/response_generic.dart';
import 'package:bhs/models/user.dart';

import 'package:bhs/providers/auth_providers.dart';
import 'package:bhs/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User user;
  AuthProvider authProvider;
  final FlutterSecureStorage storage = FlutterSecureStorage();

  void updateUser(User updateUser) {
    user = updateUser;
    notifyListeners();
  }

  void update(AuthProvider newauthProvider) async {
    authProvider = newauthProvider;
    user = newauthProvider.user;
    if (user == null && authProvider.isLoggedin) {
      var currentuser = await fetchCurrentUser();
      updateUser(currentuser);
    }
  }

  Future<User> fetchCurrentUser() async {
    try {
      ResponseGeneric response =
          await ApiService.getAction("auth/me", authProvider.token);
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

  Future<ListUsers> getUserData() async {
    ResponseGeneric response =
        await ApiService.getAction("user/list", authProvider.token);

    if (response != null) {
      return ListUsers.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<User> addDataUser(User user) async {
    ResponseGeneric response = await ApiService.postAction(
        user.toJson(), "auth/register", authProvider.token);

    if (response != null) {
      return User.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }
}
