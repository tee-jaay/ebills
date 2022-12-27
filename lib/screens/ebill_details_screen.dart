import 'package:ebills/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ebills.dart';
import '../widgets/details_key_value.dart';
import 'ebill_edit_screen.dart';

class EbillDetailsScreen extends StatelessWidget {
  static const routeName = "/ebill_details_screen";

  const EbillDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final loadedItem =
        Provider.of<EBills>(context, listen: false).showEbill(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebill Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EbillEditScreen.routeName);
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(spaceMedium),
            child: Column(
              children: [
                DetailsKeyValue('Paid For:', loadedItem.title),

                Text('= = = = = = = = = = = ='),
                DetailsKeyValue('Collector', '${loadedItem.collectorName.toString()}'),

                DetailsKeyValue('Payer:', loadedItem.name.toString()),

                Text('= = = = = = = = = = = ='),

                SizedBox(height: spaceExtraLarge,),

                DetailsKeyValue('Unit Now:', loadedItem.unitNow.toString()),

                DetailsKeyValue('Unit Prev:', loadedItem.unitPrev.toString()),

                DetailsKeyValue('Per Unit:', '${loadedItem.rate.toString()} $currency'),

                Text('- - - - - - - - - - - - - -'),

                SizedBox(height: spaceExtraLarge,),

                DetailsKeyValue('Due:', '${loadedItem.due.toString()} $currency'),

                DetailsKeyValue('Advance', '${loadedItem.advance.toString()} $currency'),

                DetailsKeyValue('Charge', '${loadedItem.charge.toString()} $currency'),

                Text('- - - - - - - - - - - - - -'),

                SizedBox(height: spaceExtraLarge,),

                DetailsKeyValue('Amount', '${loadedItem.amount.toString()} $currency'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
