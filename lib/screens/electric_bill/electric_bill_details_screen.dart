import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/constants.dart';
import '../../providers/electric_bills.dart';
import '../../widgets/sign_out_btn.dart';
import 'electric_bill_edit_screen.dart';
import '../../widgets/details_key_value.dart';
import '../../widgets/divider_line.dart';
import '../../widgets/image_input.dart';

class ElectricBillDetailsScreen extends StatefulWidget {
  static const routeName = electricBillDetailsScreenRouteName;

  const ElectricBillDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ElectricBillDetailsScreen> createState() =>
      _ElectricBillDetailsScreenState();
}

class _ElectricBillDetailsScreenState extends State<ElectricBillDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final loadedItem =
        Provider.of<ElectricBills>(context, listen: false).showElectricBill(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillDetailsScreenTitle),
        actions: const [
          SignOutBtn(),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(spaceMedium),
              child: Column(
                children: [
                  detailsKeyValue('Paid For:', loadedItem.title),
                  const DividerLine(spaceMedium, 2.0, Colors.black),
                  detailsKeyValue(
                      'Collector', loadedItem.collectorName.toString()),
                  detailsKeyValue('Payer:', loadedItem.name.toString()),
                  detailsKeyValue('Paid At:', loadedItem.paidDate.toString()),
                  const SizedBox(
                    height: spaceMax,
                  ),
                  detailsKeyValue('Unit Now:', loadedItem.unitNow.toString()),
                  detailsKeyValue('Unit Prev:', loadedItem.unitPrev.toString()),
                  detailsKeyValue('Per Unit:',
                      '${loadedItem.unitRate.toString()} $currency'),
                  const SizedBox(
                    height: spaceExtraLarge,
                  ),
                  detailsKeyValue(
                      'Due:', '${loadedItem.due.toString()} $currency'),
                  detailsKeyValue(
                      'Advance', '${loadedItem.advance.toString()} $currency'),
                  detailsKeyValue(
                      'Charge', '${loadedItem.charge.toString()} $currency'),
                  const DividerLine(spaceMedium, 1.0, Colors.black),
                  detailsKeyValue(
                      'Amount', '${loadedItem.amount.toString()} $currency'),
                  const SizedBox(
                    height: spaceMedium,
                  ),
                  ImageInput(
                    id: id,
                    imageUrl: loadedItem.imageUrl.toString(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context)
              .pushNamed(ElectricBillEditScreen.routeName, arguments: id);
        },
      ),
    );
  }
}
