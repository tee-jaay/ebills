import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_services.dart';

class SignOutBtn extends StatelessWidget {
  const SignOutBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthServices>(context, listen: true);

    return IconButton(
      onPressed: () {
        authProvider.signOut;
      },
      icon: const Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
    );
  }
}
