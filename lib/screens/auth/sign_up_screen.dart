import 'package:flutter/material.dart';

import '../../settings/constants.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = authSignUpScreenRouteName;

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sign up'),
    );
  }
}
