import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'settings/constants.dart';

import 'providers/electric_bills.dart';
import 'screens/electric_bill/electric_bill_list_screen.dart';
import 'screens/electric_bill/electric_bill_add_screen.dart';
import 'screens/electric_bill/electric_bill_details_screen.dart';
import 'screens/electric_bill/electric_bill_edit_screen.dart';
import 'screens/auth/password_request_screen.dart';
import 'screens/auth/sign_in_screen.dart';
import 'screens/auth/sign_up_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ElectricBills()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const ListScreen(),
        home: const ElectricBillAddScreen(),
        routes: {
          ElectricBillListScreen.routeName: (ctx) =>
              const ElectricBillListScreen(),
          ElectricBillDetailsScreen.routeName: (ctx) =>
              const ElectricBillDetailsScreen(),
          ElectricBillAddScreen.routeName: (ctx) =>
              const ElectricBillAddScreen(),
          ElectricBillEditScreen.routeName: (ctx) =>
              const ElectricBillEditScreen(),
          SignUpScreen.routeName: (ctx) => const SignUpScreen(),
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          PasswordRequestScreen.routeName: (ctx) =>
              const PasswordRequestScreen(),
        },
      ),
    );
  }
}
