import 'package:flutter/material.dart';

import '../../settings/constants.dart';

class ElectricBillEditScreen extends StatelessWidget {
  static const routeName = electricBillEditScreenRouteName;

  const ElectricBillEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillEditScreenTitle),
      ),
      body: Center(
        child: const Text(electricBillEditScreenTitle),
      ),
    );
  }
}
