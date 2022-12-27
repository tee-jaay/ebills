import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'settings/constants.dart';

import 'providers/electric_bills.dart';
import 'screens/electric_bill/list_screen.dart';
import 'screens/electric_bill/add_screen.dart';
import 'screens/electric_bill/details_screen.dart';
import 'screens/electric_bill/edit_screen.dart';
import 'screens/auth/password_request_screen.dart';
import 'screens/auth/sign_in_screen.dart';
import 'screens/auth/sign_up_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // the root of application.
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
        home: const ListScreen(),
        routes: {
          DetailsScreen.routeName: (ctx) => const DetailsScreen(),
          AddScreen.routeName: (ctx) => const AddScreen(),
          EditScreen.routeName: (ctx) => const EditScreen(),
          SignUpScreen.routeName: (ctx) => const SignUpScreen(),
          SignInScreen.routeName: (ctx) => const SignInScreen(),
          PasswordRequestScreen.routeName: (ctx) => const PasswordRequestScreen(),
        },
      ),
    );
  }
}
