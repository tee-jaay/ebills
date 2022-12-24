import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../providers/ebills.dart';
import 'ebill_item.dart';

class EbillsList extends StatelessWidget {
  const EbillsList({Key? key}) : super(key: key);

  Future<void> _refreshEbills(BuildContext context) async {
    await Provider.of<EBills>(context, listen: false).fetchAndSetAllEbills();
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
                          child: Consumer<EBills>(
                            builder: (_, itemsData, __) {
                              return Padding(
                                padding: const EdgeInsets.all(spaceSmall),
                                child: ListView.builder(
                                  itemCount: itemsData.ebills.length,
                                  itemBuilder: (_, i) => EbillItem(
                                    title: itemsData.ebills[i].title ?? '',
                                    rate: itemsData.ebills[i].rate ?? '',
                                    unit: itemsData.ebills[i].unit ?? '',
                                    amount: itemsData.ebills[i].amount ?? '',
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
