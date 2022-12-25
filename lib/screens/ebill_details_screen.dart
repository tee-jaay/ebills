import 'package:ebills/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ebills.dart';

class EbillDetailsScreen extends StatelessWidget {
  static const routeName = "/ebill-details-screen";

  const EbillDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ebillTitle = ModalRoute.of(context)?.settings.arguments as String;
    final loadedItem =
        Provider.of<EBills>(context, listen: false).showEbill(ebillTitle);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebill Details'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: spaceSmall,
            ),
            Text(
              'Paid For: ${loadedItem.title.toString()}',
              style: TextStyle(fontSize: spaceMax),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: spaceSmall,
            ),
            Text(
              'Payer: ${loadedItem.name.toString()}',
              style: TextStyle(fontSize: spaceExtraLarge),
            ),
            Text(
              'Unit Now: ${loadedItem.unitNow.toString()}',
              style: const TextStyle(),
            ),
            Text(
              'Unit Prev: ${loadedItem.unitPrev.toString()}',
              style: const TextStyle(),
            ),
            Text(
              'Per Unit: ${loadedItem.rate.toString()} $currency',
              style: const TextStyle(),
            ),
            Text(
              'Due: ${loadedItem.due.toString()} $currency',
              style: const TextStyle(),
            ),
            Text(
              'Advance: ${loadedItem.advance.toString()} $currency',
              style: const TextStyle(),
            ),
            Text(
              'Charge: ${loadedItem.charge.toString()} $currency',
              style: const TextStyle(),
            ),
            Text(
              'Amount: ${loadedItem.amount.toString()} $currency',
              style: const TextStyle(),
            ),
            Text(
              'Collector: ${loadedItem.collectorName.toString()}',
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
