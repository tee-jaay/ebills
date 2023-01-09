import 'package:ebills/providers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'settings/app_routes.dart';
import 'settings/constants.dart';
import 'services/auth_services.dart';
import 'providers/electric_bills.dart';
import 'screens/auth/sign_in_screen.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ElectricBills()),
        ChangeNotifierProvider.value(value: Authentication()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen(),
        routes: appRoutes,
      ),
    );
  }
}
