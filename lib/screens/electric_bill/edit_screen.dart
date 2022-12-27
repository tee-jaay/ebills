import 'package:flutter/material.dart';

import '../../settings/constants.dart';

class EditScreen extends StatelessWidget {
  static const routeName = electricBillEditScreenRouteName;

  const EditScreen({Key? key}) : super(key: key);

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
