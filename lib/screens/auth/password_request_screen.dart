import 'package:flutter/material.dart';

import '../../settings/constants.dart';

class PasswordRequestScreen extends StatefulWidget {
  static const routeName = authPasswordRequestScreenRouteName;
  const PasswordRequestScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRequestScreen> createState() => _PasswordRequestScreenState();
}

class _PasswordRequestScreenState extends State<PasswordRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Password forgot'),
    );
  }
}
