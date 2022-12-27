import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'ebill_create_screen.dart';
import '../widgets/ebills_list.dart';

class EbillsListScreen extends StatelessWidget {
  static const routeName = '/ebills_list_screen';

  const EbillsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebills List'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EbillCreateScreen.routeName);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const EbillsList(),
    );
  }
}
