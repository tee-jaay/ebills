import 'package:flutter/material.dart';

import '../constants.dart';

class EbillItem extends StatelessWidget {
  const EbillItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: spaceMedium),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: spaceMax, horizontal: spaceMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Month Name'),
            Text('Unit'),
            Text('Rate'),
            Text('Amount'),
            Text('Date'),
          ],
        ),
      ),
    );
  }
}
