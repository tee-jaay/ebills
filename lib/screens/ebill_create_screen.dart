import 'package:flutter/material.dart';

class EbillCreateScreen extends StatelessWidget {
  static const routeName = "/ebill_create_screen";

  const EbillCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New'),),
      body: Center(
        child: Text('Add new ebill record'),
      ),
    );
  }
}
