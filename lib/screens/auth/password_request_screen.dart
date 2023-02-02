import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import '../../widgets/center_progress.dart';
import 'password_reset_screen.dart';

class PasswordRequestScreen extends StatefulWidget {
  const PasswordRequestScreen({Key? key}) : super(key: key);
  static const routeName = authPasswordRequestScreenRouteName;

  @override
  State<PasswordRequestScreen> createState() => _PasswordRequestScreenState();
}

class _PasswordRequestScreenState extends State<PasswordRequestScreen> {
  final _formKey = GlobalKey<FormState>();

  final _isLoading = false;

  late String _email = '';

  Future<void> _handleSubmit() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    if (kDebugMode) {
      print('handle submit');
      print(_email);
    }
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
                            labelText: 'Email',
                            icon: Icon(Icons.message),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            } else if (!regExpEmail.hasMatch(value)) {
                              return 'Email is invalid';
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
