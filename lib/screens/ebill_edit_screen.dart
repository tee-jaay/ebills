import 'package:flutter/material.dart';

class EbillEditScreen extends StatelessWidget {
  static const routeName = '/ebill_edit_screen';

  const EbillEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ebill'),
      ),
      body: Center(
        child: Text('Edit ebill screen'),
      ),
    );
  }
}
