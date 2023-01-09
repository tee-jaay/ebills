import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier{
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
  }

  bool getIsAuthenticated(){
    return isAuthenticated;
  }

  void setIsAuthenticated(bool value){
    isAuthenticated = value;
  }

  void authenticateUser(http.Response response) {
    final decodedBody = jsonDecode(response.body);
    if (decodedBody["accessToken"] != null) {
      isAuthenticated = true;
      print("isAuthenticated ==== ");
      print(isAuthenticated);
      print("isAuthenticated ==== ");
    }
  }

  void unAuthenticateUser(http.Response response) {
    final decodedBody = jsonDecode(response.body);
    if (decodedBody["accessToken"] != null) {
      isAuthenticated = false;
      print("isAuthenticated ==== ");
      print(isAuthenticated);
      print("isAuthenticated ==== ");
    }
  }

}