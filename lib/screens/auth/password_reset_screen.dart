import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import '../../widgets/center_progress.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);
  static const routeName = authPasswordResetScreenRouteName;

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();

  final _isLoading = false;

  late String _password = '';
  late String _confirmPassword = '';

  Future<void> _handleSubmit() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    print('handle submit');
    print(_password);
    print(_confirmPassword);
    //Todo: validate email
    Navigator.pushNamed(context, PasswordResetScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const CenterProgress()
          : Form(
        key: _formKey,
        child: Card(
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(spaceLarge),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.key_rounded),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (!regExpPassword.hasMatch(value)) {
                        return 'Password is weak';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (_) {},
                  ),
                  const SizedBox(
                    height: spaceExtraLarge,
                  ),
                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      icon: Icon(Icons.key),
                    ),
                    validator: (String? value) {
                      if (value! != _password) {
                        return 'Passwords did not match';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) {},
                  ),
                  const SizedBox(
                    height: spaceExtraLarge,
                  ),
                  TextButton(
                    onPressed: _handleSubmit,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    child: const Text(
                      'Send Password Reset Email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
