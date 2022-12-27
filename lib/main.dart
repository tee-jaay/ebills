import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

import 'providers/ebills.dart';
import 'screens/ebill_create_screen.dart';
import 'screens/ebill_details_screen.dart';
import 'screens/ebills_list_screen.dart';
import 'screens/ebill_edit_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // the root of application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: EBills()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EbillsListScreen(),
        routes: {
          EbillDetailsScreen.routeName: (ctx) => const EbillDetailsScreen(),
          EbillCreateScreen.routeName:(ctx) => const EbillCreateScreen(),
          EbillEditScreen.routeName:(ctx)=> const EbillEditScreen(),
        },
      ),
    );
  }
}
