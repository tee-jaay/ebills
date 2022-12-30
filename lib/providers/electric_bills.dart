import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/electric_bill.dart';

class ElectricBills with ChangeNotifier {
  // Declare local class for electric bills
  final List<ElectricBill> _electricBills = [];

  // Fetch and set electric bills data
  Future<void> fetchAndSetAllElectricBills() async {
    if (_electricBills.isNotEmpty) {
      return;
    }

    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5000')}/electric-bills/index');

      final response = await http.get(url);

      if (response.body.isEmpty) {
        if (kDebugMode) {
          print('Empty data');
        }
        return;
      }

      final decodedData = jsonDecode(response.body) as List<dynamic>;
      if (kDebugMode) {
        // print(decodedData);
      }

      for (var element in decodedData) {
        _electricBills.add(ElectricBill(
            id: element["id"],
            title: element["title"],
            unitNow: element["unitNow"].toString(),
            unitRate: element["unitRate"].toString(),
            amount: element["amount"].toString(),
            name: element["name"].toString(),
            collectorName: element["collectorName"].toString(),
            unitPrev: element["unitPrev"].toString(),
            charge: element["charge"].toString(),
            due: element["due"].toString(),
            advance: element["advance"].toString(),
            paidDate: element["paidDate"].toString()));
      }
      // notify the listeners
      notifyListeners();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Add electric bill data
  Future<int> addElectricBill(Object obj) async {
    late int addResponseStatus;
    // Basic auth config for cyclic
    String username = dotenv.get("cyclicUsername", fallback: '');
    String password = dotenv.get("cyclicPassword", fallback: '');
    String userPassword = '$username:$password';
    String usernamePasswordWithCodeUnits =
        base64.encode(userPassword.codeUnits);
    String basicAuth = 'Basic $usernamePasswordWithCodeUnits';
    // Basic auth config for cyclic
    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5000')}/electric-bills/create');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": basicAuth
      });
      addResponseStatus = response.statusCode;

      if (addResponseStatus == 201) {
        clearAndFetchElectricBills();
      }
      // notify the listeners
      notifyListeners();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return addResponseStatus;
  }

  // Show single electric bill
  ElectricBill showElectricBill(String id) {
    return _electricBills.firstWhere((element) => element.id == id);
  }

  // Update electric bill's data
  Future<void> updateElectricBill(String id, Object obj) async {
    if (kDebugMode) {
      print('update E bill');
      print(obj);
    }
    return;
  }

  // Delete electric bill's data
  Future<void> deleteElectricBill(String id) async {
    if (kDebugMode) {
      print(id);
    }
    return;
  }

  List<ElectricBill> get electricBills {
    return [..._electricBills];
  }

  void clearAndFetchElectricBills() {
    _electricBills.clear();
  }
}
