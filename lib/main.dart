import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'settings/app_routes.dart';
import 'settings/constants.dart';
import 'providers/electric_bills.dart';
import 'providers/authentication.dart';
import 'services/auth_services.dart';
import 'screens/electric_bill/electric_bill_list_screen.dart';
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
        ChangeNotifierProvider(
          create: (_) => AuthServices(),
        ),
        ChangeNotifierProvider(
          create: (_) => ElectricBills(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ElectricBillListScreen(),
            routes: appRoutes,
          );
        },
      ),
    );
  }
}
