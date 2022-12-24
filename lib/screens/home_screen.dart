import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/ebills_list.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: (){if (kDebugMode) {
              print('add ebill');
            }},
            icon: const Icon(Icons.add, color: Colors.white,),
          ),
        ],
      ),
      body: const EbillsList(),
    );
  }
}
