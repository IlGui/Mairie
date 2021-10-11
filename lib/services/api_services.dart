import 'dart:convert';
import 'dart:io';
import 'package:bhs/models/responses/response_generic.dart';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL =
      IS_DEBUG ? '10.0.2.2:8000' : 'api-ogii-mairie.com';
  static const String BASE_URL2 =
      IS_DEBUG ? 'http://10.0.2.2:8000' : 'https://api-ogii-mairie.com';
  static const String BASE_URL_API = BASE_URL + '/api';
  static const bool IS_DEBUG = true;
}

class ApiService {
  static Future<ResponseGeneric> getAction(action, token) async {
    final Uri uri = manageuri(action);
    if (token == null) {
      http.Response response =
          await http.get(uri, headers: {"Accept": "application/json"});
      return handleResponse(response);
    } else {
      final response = await http.get(uri, headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $token'
      });
      return handleResponse(response);
    }
  }

  static Uri manageuri(String action) => URLS.IS_DEBUG
      ? Uri.http('${URLS.BASE_URL}', '/api/$action')
      : Uri.https('${URLS.BASE_URL}', '/api/$action');

  static Future<dynamic> postAction(body, action, token) async {
    try {
      print(json.encode(body));
      final Uri uri = manageuri(action);
      if (token == "") {
        http.Response response = await http.post(uri,
            headers: {
              HttpHeaders.acceptHeader: "application/json",
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: json.encode(body));
        return handleResponse(response);
      } else {
        http.Response response = await http.post(uri,
            headers: {
              HttpHeaders.acceptHeader: "application/json",
              HttpHeaders.authorizationHeader: 'Bearer $token',
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: json.encode(body));
        return handleResponse(response);
      }
    } catch (onError) {
      print(onError.toString());
      return null;
    }
  }

  static Future<dynamic> postActionWithoutBody(action, token) async {
    try {
      final Uri uri = manageuri(action);
      if (token == "") {
        http.Response response = await http.post(
          uri,
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.contentTypeHeader: "application/json"
          },
        );
        return handleResponse(response);
      } else {
        http.Response response = await http.post(
          uri,
          headers: {
            HttpHeaders.acceptHeader: "application/json",
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: "application/json"
          },
        );
        return handleResponse(response);
      }
    } catch (onError) {
      print(onError.toString());
      return null;
    }
  }

  static ResponseGeneric handleResponse(http.Response response) {
    ResponseGeneric responseGeneric;
    if (response.statusCode == 200) {
      responseGeneric = ResponseGeneric.fromJson(json.decode(response.body));
      return responseGeneric;
    } else {
      return null;
    }
  }

  static Future<dynamic> putAction(action, body, token) async {
    try {
      final Uri uri = manageuri(action);
      http.Response response = await http.put(
        uri,
        body: json.encode(body),
        headers: {
          HttpHeaders.acceptHeader: "application/json",
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json"
        },
      );
      return handleResponse(response);
    } catch (onError) {
      print(onError.toString());
      return null;
    }
  }

  static Future<dynamic> puAction(body, action, token) async {
    try {
      print(json.encode(body));
      final Uri uri = manageuri(action);
      if (token == "") {
        http.Response response = await http.put(uri,
            headers: {
              HttpHeaders.acceptHeader: "application/json",
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: json.encode(body));
        return handleResponse(response);
      } else {
        http.Response response = await http.put(uri,
            headers: {
              HttpHeaders.acceptHeader: "application/json",
              HttpHeaders.authorizationHeader: 'Bearer $token',
              HttpHeaders.contentTypeHeader: "application/json"
            },
            body: json.encode(body));
        return handleResponse(response);
      }
    } catch (onError) {
      print(onError.toString());
      return null;
    }
  }
}
