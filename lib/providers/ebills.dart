import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/ebill.dart';

class EBills with ChangeNotifier {
  // Declare local class for ebills
  final List<EBill> _ebills = [];

  // Fetch and set ebills data
  Future<void> fetchAndSetAllEbills() async {
    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5555')}/ebills/index');

      final response = await http.get(url);

      if (response.body.isEmpty) {
        if (kDebugMode) {
          print('Empty data');
        }
        return;
      }

      final decodedData = jsonDecode(response.body) as List<dynamic>;

      for (var element in decodedData) {
        _ebills.add(EBill(
            title: element["title"],
            unit: element["unitNow"].toString(),
            rate: element["unitRate"].toString(),
            amount: element["amount"].toString(),
            date: element["date"]));
      }
      // notify the listeners
      notifyListeners();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Add ebills data
  Future<void> addEbill() async {
    if (kDebugMode) {
      print('add an ebill');
    }
    return;
  }

  // Show single ebill
  Future<void> showEbill(String id) async {
    if (kDebugMode) {
      print('showEbill');
    }
    if (kDebugMode) {
      print(id);
    }
    return;
  }

  // Update ebills data
  Future<void> updateEbill(String id) async {
    if (kDebugMode) {
      print('updateEbill');
    }
    if (kDebugMode) {
      print(id);
    }
    return;
  }

  // Delete ebills data
  Future<void> deleteEbill(String id) async {
    if (kDebugMode) {
      print(id);
    }
    return;
  }

  List<EBill> get ebills {
    return [..._ebills];
  }
}
