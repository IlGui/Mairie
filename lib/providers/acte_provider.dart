import 'package:bhs/models/acte.dart';
import 'package:bhs/models/responses/response_generic.dart';
import 'package:bhs/providers/auth_providers.dart';
import 'package:bhs/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ActeApiProvider with ChangeNotifier {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  AuthProvider authProvider;
  Acte acte;

  void update(AuthProvider newauthProvider) async {
    authProvider = newauthProvider;
  }

  Future<ListActe> getBakeryData() async {
    ResponseGeneric response =
        await ApiService.getAction("acte/list", authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<Acte> GetActeById(int id) async {
    ResponseGeneric response = await ApiService.getAction(
        "acte/single/" + id.toString(), authProvider.token);

    if (response != null) {
      return Acte.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeEncourByUserId(int id) async {
    ResponseGeneric response = await ApiService.getAction(
        "acte/listActeEncoursUser/" + id.toString(), authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeTraiteByUserId(int id) async {
    ResponseGeneric response = await ApiService.getAction(
        "acte/listActeTraitesUser/" + id.toString(), authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeTraite() async {
    ResponseGeneric response =
        await ApiService.getAction("acte/listActeTraites", authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<ListActe> GetActeEncours() async {
    ResponseGeneric response =
        await ApiService.getAction("acte/listActeEncours", authProvider.token);

    if (response != null) {
      return ListActe.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<Acte> addDataActe(Acte acte) async {
    ResponseGeneric response = await ApiService.postAction(
        acte.toJson(), "acte/add", authProvider.token);

    if (response != null) {
      return Acte.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }

  Future<Acte> updateActe(int id, Acte acte) async {
    ResponseGeneric response = await ApiService.puAction(
        acte.toJson(), "acte/update/" + id.toString(), authProvider.token);

    if (response != null) {
      return Acte.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }
}
