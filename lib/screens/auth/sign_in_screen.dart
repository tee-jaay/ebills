import 'package:flutter/material.dart';

import '../../services/auth_services.dart';
import 'sign_up_screen.dart';
import '../../settings/constants.dart';
import '../../widgets/center_progress.dart';
import '../electric_bill/electric_bill_list_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = authSignInScreenRouteName;

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _isLoading = false;

  late String _email = '';
  late String _password = '';

  final _passwordFocusNode = FocusNode();

  Future<void> _handleSubmit() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }

    dynamic newUserObj = {"email": _email, "password": _password};

    AuthServices authServices = AuthServices();
    authServices.signIn(newUserObj);

    Navigator.pushNamed(context, ElectricBillListScreen.routeName);
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
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                        ),
                        TextFormField(
                          focusNode: _passwordFocusNode,
                          initialValue: '',
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            icon: Icon(Icons.key),
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
                          keyboardType: TextInputType.text,
                          obscureText: true,
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
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: spaceExtraLarge,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const TextSpan(text: ' here'),
                                  ]),
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
