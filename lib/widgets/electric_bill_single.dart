import 'package:flutter/material.dart';

import '../settings/constants.dart';
import '../screens/electric_bill/details_screen.dart';

class ElectricBillSingle extends StatelessWidget {
  final String id;
  final String title;
  final String rate;
  final String unit;
  final String amount;

  const ElectricBillSingle({
    required this.id,
    required this.title,
    required this.rate,
    required this.unit,
    required this.amount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: spaceMedium, horizontal: spaceSmall),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
            vertical: spaceMax, horizontal: spaceMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '$rate tk',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '$unit Unit',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: spaceMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        DetailsScreen.routeName,
                        arguments: id);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue),
                  ),
                  child: const Text(
                    'view',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
