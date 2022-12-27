import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import 'electric_bill_add_screen.dart';
import '../../widgets/electric_bills_list.dart';

class ElectricBillListScreen extends StatelessWidget {
  static const routeName = electricBillsListScreenRouteName;

  const ElectricBillListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillsListScreenTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ElectricBillAddScreen.routeName);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const ElectricBillsList(),
    );
  }
}
