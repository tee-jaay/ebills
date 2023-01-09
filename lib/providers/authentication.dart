import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../models/user.dart';

class Authentication with ChangeNotifier {
  User userData = User(id: '', email: '', username: '', accessToken: '');
  bool _isAuthenticated = false;
  String _token = '';

  String get token {
    //Todo: Validate token expiry
    if (_token.isNotEmpty) {
      return _token;
    }
    return '';
  }

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  bool getIsAuthenticated() {
    return isAuthenticated;
  }

  void setIsAuthenticated(bool value) {
    isAuthenticated = value;
  }

  bool authenticateUser(http.Response response) {
    final decodedBody = jsonDecode(response.body);
    if (decodedBody["accessToken"] != null) {
      // Authenticate if token is not expired
      _token = decodedBody["accessToken"];
      bool isExpired = Jwt.isExpired(token);
      if (!isExpired) {
        // Set authenticated user data
        userData.id = decodedBody["id"].toString();
        userData.email = decodedBody["email"].toString();
        userData.username = decodedBody["username"].toString();
        userData.accessToken = decodedBody["accessToken"].toString();
        isAuthenticated = true;
      }
    }
    return isAuthenticated = false;
  }

  void unAuthenticateUser() {
    userData.id = "";
    userData.email = "";
    userData.username = "";
    userData.accessToken = "";
    isAuthenticated = false;
  }
}
