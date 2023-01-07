import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../settings/set_server_headers.dart';

class AuthServices with ChangeNotifier {
  int _httpResponseStatus = 0;

  Future<int> signUp(Object obj) async {
    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5000')}/auth/sign-up');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });
      print(response.body);
      _httpResponseStatus = response.statusCode;

      // notify the listeners
      // notifyListeners();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return _httpResponseStatus;
  }

  Future<int> signIn(Object obj) async {
    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5000')}/auth/sign-in');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });
      print(response.body);
      _httpResponseStatus = response.statusCode;

      // notify the listeners
      // notifyListeners();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return _httpResponseStatus;
  }

  Future<String> signOut() async {
    // await func
    if (kDebugMode) {
      print('signOut');
    }
    return 'sign out';
  }
}
