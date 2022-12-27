import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import 'add_screen.dart';
import '../../widgets/electric_bills_list.dart';

class ListScreen extends StatelessWidget {
  static const routeName = electricBillsListScreenRouteName;

  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillsListScreenTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddScreen.routeName);
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
