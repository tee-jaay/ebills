import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

class Authentication with ChangeNotifier {
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
      _token = decodedBody["accessToken"];
      // Check if token is expired
      bool isExpired = Jwt.isExpired(token);
      if (!isExpired) {
        // Authenticate if token is not expired
        isAuthenticated = true;
      }
    }
    return isAuthenticated = false;
  }

  void unAuthenticateUser(http.Response response) {
    final decodedBody = jsonDecode(response.body);
    if (decodedBody["accessToken"] != null) {
      isAuthenticated = false;
    }
  }
}
