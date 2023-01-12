import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth_services.dart';
import '../auth/sign_in_screen.dart';
import '../../providers/authentication.dart';
import '../../settings/constants.dart';
import 'electric_bill_add_screen.dart';
import '../../widgets/electric_bills_list.dart';

class ElectricBillListScreen extends StatefulWidget {
  static const routeName = electricBillsListScreenRouteName;

  ElectricBillListScreen({Key? key}) : super(key: key);

  @override
  State<ElectricBillListScreen> createState() => _ElectricBillListScreenState();
}

class _ElectricBillListScreenState extends State<ElectricBillListScreen> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(electricBillsListScreenTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ElectricBillAddScreen.routeName);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: authProvider.isAuth
          ? const ElectricBillsList()
          : const SignInScreen(),
    );
  }
}
