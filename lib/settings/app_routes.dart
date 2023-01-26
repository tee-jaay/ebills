import 'package:flutter/cupertino.dart';

import '../screens/auth/password_request_screen.dart';
import '../screens/auth/password_reset_screen.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/auth/sign_up_screen.dart';
import '../screens/electric_bill/electric_bill_add_screen.dart';
import '../screens/electric_bill/electric_bill_details_screen.dart';
import '../screens/electric_bill/electric_bill_edit_screen.dart';
import '../screens/electric_bill/electric_bill_list_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  ElectricBillListScreen.routeName: (ctx) => ElectricBillListScreen(),
  ElectricBillDetailsScreen.routeName: (ctx) =>
      const ElectricBillDetailsScreen(),
  ElectricBillAddScreen.routeName: (ctx) => const ElectricBillAddScreen(),
  ElectricBillEditScreen.routeName: (ctx) => const ElectricBillEditScreen(),
  SignUpScreen.routeName: (ctx) => const SignUpScreen(),
  SignInScreen.routeName: (ctx) => const SignInScreen(),
  PasswordRequestScreen.routeName: (ctx) => const PasswordRequestScreen(),
  PasswordResetScreen.routeName: (ctx) => const PasswordResetScreen(),
};
