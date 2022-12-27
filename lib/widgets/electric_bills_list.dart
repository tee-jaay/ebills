import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../settings/constants.dart';
import '../providers/electric_bills.dart';
import 'electric_bill_single.dart';

class ElectricBillsList extends StatelessWidget {
  const ElectricBillsList({Key? key}) : super(key: key);

  Future<void> _refreshEbills(BuildContext context) async {
    await Provider.of<ElectricBills>(context, listen: false).fetchAndSetAllElectricBills();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: _refreshEbills(context),
              builder: (ctx, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () => _refreshEbills(context),
                          child: Consumer<ElectricBills>(
                            builder: (_, itemsData, __) {
                              return Padding(
                                padding: const EdgeInsets.all(spaceSmall),
                                child: ListView.builder(
                                  itemCount: itemsData.electricBills.length,
                                  itemBuilder: (_, i) => ElectricBillSingle(
                                    id: itemsData.electricBills[i].id ?? '',
                                    title: itemsData.electricBills[i].title ?? '',
                                    rate: itemsData.electricBills[i].rate ?? '',
                                    unit: itemsData.electricBills[i].unitNow ?? '',
                                    amount: itemsData.electricBills[i].amount ?? '',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
