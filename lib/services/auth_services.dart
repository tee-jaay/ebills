import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../settings/set_server_headers.dart';
import '../providers/authentication.dart';

class AuthServices extends Authentication {
  int _httpResponseStatus = 0;

  Future<int> signUp(Object obj) async {
    try {
      var url = Uri.parse('${dotenv.get("serverUrl")}/auth/sign-up');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });

      authenticateUser(response);

      _httpResponseStatus = response.statusCode;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return _httpResponseStatus;
  }

  Future<int> signIn(Object obj) async {
    try {
      var url = Uri.parse('${dotenv.get("serverUrl")}/auth/sign-in');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });

      authenticateUser(response);

      _httpResponseStatus = response.statusCode;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return _httpResponseStatus;
  }

  Future<String> signOut() async {
    unAuthenticateUser();
    //Todo: Remove accessToken from server
    if (kDebugMode) {
      print('signOut');
    }
    return 'sign out';
  }
}
