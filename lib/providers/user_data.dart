import 'package:flutter/foundation.dart';

class UserData with ChangeNotifier {
  UserData(this.email, this.username,
      {required this.id, required this.isLoggedIn});

  bool isLoggedIn;
  String username;
  String email;
  String id;
}
