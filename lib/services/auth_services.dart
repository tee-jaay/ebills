import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import '../settings/set_server_headers.dart';
import '../providers/authentication.dart';

class AuthServices with ChangeNotifier {
  int _httpResponseStatus = 0;
  bool _isLoading = false;
  bool _isAuth = false;
  String _token = '';
  late Timer? _authTimer;

  String get token => _token;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isAuth => _isAuth;

  set isAuth(bool value) {
    _isAuth = value;
    notifyListeners();
  }

  Future<int> signUp(Object obj) async {
    isLoading = true;
    try {
      var url = Uri.parse('${dotenv.get("serverUrl")}/auth/sign-up');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });

      if (response.statusCode == 201) {
        await authenticateUser(response);
      }
      _httpResponseStatus = response.statusCode;
      isLoading = false;
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
      isLoading = false;
    }
    return _httpResponseStatus;
  }

  Future<int> signIn(Object obj) async {
    isLoading = true;
    try {
      var url = Uri.parse('${dotenv.get("serverUrl")}/auth/sign-in');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });

      if (response.statusCode == 200) {
        await authenticateUser(response);
      }

      if (response.body == "Wrong credentials!") {
        _httpResponseStatus = 400;
      } else {
        _httpResponseStatus = response.statusCode.toInt();
      }
      isLoading = false;
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
      isLoading = false;
    }
    return _httpResponseStatus;
  }

  void signOut(){
    unAuthenticateUser();
    //Todo: Remove accessToken from server
    if (kDebugMode) {
      print('signOut');
    }
  }

  Future<void> authenticateUser(http.Response response) async {
    final decodedBody = jsonDecode(response.body);

    // Authenticate if token is not expired
    _token = decodedBody["accessToken"];
    bool isExpired = Jwt.isExpired(token);
    if (!isExpired) {
      isAuth = true;
      _autoSignOut();
    }
  }

  void unAuthenticateUser() {
    isAuth = false;
    _clearUserData();
  }

  void _clearUserData() {}

  void _autoSignOut() {
    DateTime? expiryDate = Jwt.getExpiryDate(token);
    final timeToExpiry = expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), unAuthenticateUser);
  }
}
