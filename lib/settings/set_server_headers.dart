import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetServerHeaders {
  //  Headers credentials for cyclic
  static String basicAuthHeaders() {
    String userPassword =
        '${dotenv.get("cyclicUsername", fallback: '')}:${dotenv.get("cyclicPassword", fallback: '')}';
    return 'Basic ${base64.encode(utf8.encode(userPassword))}';
  }
}