import 'package:flutter/material.dart';

class EbillDetailsScreen extends StatelessWidget {
  static const routeName = "/ebill-details-screen";

  const EbillDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebill Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Tenant name',
            style: TextStyle(),
          ),
          Text(
            'Month Year',
            style: TextStyle(),
          ),
          Text(
            'Amount',
            style: TextStyle(),
          ),
          Text(
            'Previous Units',
            style: TextStyle(),
          ),
          Text(
            'Now Units',
            style: TextStyle(),
          ),
          Text(
            'Amount',
            style: TextStyle(),
          ),
          Text(
            'Rate',
            style: TextStyle(),
          ),
          Text(
            'Collector Name',
            style: TextStyle(),
          ),
        ],
      ),
    );
  }
}
