import 'package:flutter/material.dart';

import '../../settings/constants.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = authSignInScreenRouteName;

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sign In'),
    );
  }
}
