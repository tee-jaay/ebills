import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import '../../widgets/electric_bill_create_form.dart';

class AddScreen extends StatelessWidget {
  static const routeName = electricBillAddScreenRouteName;

  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillAddScreenTitle),
      ),
      body: const Card(
        margin: EdgeInsets.all(spaceSmall),
        child: Padding(
          padding: EdgeInsets.all(spaceSmall),
          child: ElectricBillCreateForm(),
        ),
      ),
    );
  }
}
