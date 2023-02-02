import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../models/user.dart';

class Authentication with ChangeNotifier {
  User userData = User(
      id: '', email: '', username: '', accessToken: '', isAuthenticated: false);
  bool _isAuth = false;
  String _token = '';
  late Timer? _authTimer;

  bool get isAuth => _isAuth;

  set isAuth(bool value) {
    _isAuth = value;
    notifyListeners();
    print('********** Setter _isAuth **********');
    print(_isAuth);
    print('********** Setter _isAuth **********');
  }

  String get token {
    //Todo: Validate token expiry
    if (_token.isNotEmpty) {
      return _token;
    }
    return '';
  }

  Future<void> authenticateUser(http.Response response) async {
    final decodedBody = jsonDecode(response.body);

    // Authenticate if token is not expired
    _token = decodedBody["accessToken"];
    bool isExpired = Jwt.isExpired(token);
    print("isExpired =========");
    print(isExpired);
    print("isExpired =========");
    //Todo: fix expiry in server side
    if (isExpired) {
      // Set authenticated user data
      userData.id = decodedBody["id"].toString();
      userData.email = decodedBody["email"].toString();
      userData.username = decodedBody["username"].toString();
      userData.accessToken = decodedBody["accessToken"].toString();

      isAuth = true;

      _autoSignOut();
    }
  }

  void unAuthenticateUser() {
    isAuth = false;
    _clearUserData();
  }

  void _clearUserData() {
    userData.id = "";
    userData.email = "";
    userData.username = "";
    userData.accessToken = "";
  }

  void _autoSignOut() {
    DateTime? expiryDate = Jwt.getExpiryDate(token);
    final timeToExpiry = expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), unAuthenticateUser);
  }
}
