import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/electric_bill.dart';

// Todo: move to a separate class and access by extend
class SetServerHeaders {
  //  Headers credentials for cyclic
  static String basicAuthHeaders() {
    String userPassword =
        '${dotenv.get("cyclicUsername", fallback: '')}:${dotenv.get("cyclicPassword", fallback: '')}';
    return 'Basic ${base64.encode(utf8.encode(userPassword))}';
  }
}

class ElectricBills with ChangeNotifier {
  int _httpResponseStatus = 0;

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

      final response = await http.get(url, headers: {
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });

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
    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5000')}/electric-bills/create');

      final response = await http.post(url, body: jsonEncode(obj), headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "Authorization": SetServerHeaders.basicAuthHeaders(),
      });
      _httpResponseStatus = response.statusCode;

      if (_httpResponseStatus == 201) {
        clearAndFetchElectricBills();
      }
      // notify the listeners
      notifyListeners();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return _httpResponseStatus;
  }

  // Show single electric bill
  ElectricBill showElectricBill(String id) {
    return _electricBills.firstWhere((element) => element.id == id);
  }

  // Update electric bill's data
  Future<int> updateElectricBill(String id, Object obj) async {
    if (kDebugMode) {
      print('update E bill');
      print(id);
      print(obj);
    }
    try {
      var url = Uri.parse(
          '${dotenv.get("serverUrl", fallback: 'http://127.0.0.1:5000')}/electric-bills/update/$id');
      final response = await http.put(url);
    } catch (err) {}
    return _httpResponseStatus;
  }

  // Delete electric bill's data
  Future<int> deleteElectricBill(String id) async {
    if (kDebugMode) {
      print(id);
    }
    return 0;
  }

  List<ElectricBill> get electricBills {
    return [..._electricBills];
  }

  void clearAndFetchElectricBills() {
    _electricBills.clear();
  }
}
