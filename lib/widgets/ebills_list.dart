import 'package:flutter/material.dart';

import 'ebill_item.dart';

class EbillsList extends StatelessWidget {
  const EbillsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (ctx, index) => EbillItem()                  ,
            ),
          )
        ],
      ),
    );
  }
}
