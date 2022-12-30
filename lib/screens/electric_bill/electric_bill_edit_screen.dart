import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/electric_bill_edit_form.dart';
import '../../providers/electric_bills.dart';
import '../../settings/constants.dart';

class ElectricBillEditScreen extends StatelessWidget {
  static const routeName = electricBillEditScreenRouteName;

  const ElectricBillEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final loadedItem = Provider.of<ElectricBills>(context).showElectricBill(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillEditScreenTitle),
      ),
      body: Card(
        margin: const EdgeInsets.all(spaceSmall),
        child: Padding(
          padding: const EdgeInsets.all(spaceSmall),
          child: ElectricBillEditForm(
            title: loadedItem.title,
            advance: loadedItem.advance,
            amount: loadedItem.amount,
            charge: loadedItem.charge,
            collectorName: loadedItem.collectorName,
            due: loadedItem.due,
            name: loadedItem.name,
            paidDate: loadedItem.paidDate,
            unitNow: loadedItem.unitNow,
            unitPrev: loadedItem.unitPrev,
            unitRate: loadedItem.unitRate,
          ),
        ),
      ),
    );
  }
}
