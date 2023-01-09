import 'package:flutter/material.dart';

import '../../services/auth_services.dart';
import '../../widgets/build_submit_button.dart';
import '../../widgets/center_progress.dart';
import 'sign_in_screen.dart';
import '../../settings/constants.dart';
import '../electric_bill/electric_bill_list_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = authSignUpScreenRouteName;

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _isFetching = false;

  late String _email = '';
  late String _username = '';
  late String _password = '';

  final _emailFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  Future<void> _handleSubmit() async {
    // Validation
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();

    dynamic newUserObj = {
      "email": _email,
      "username": _username,
      "password": _password
    };

    try {
      setState(() {
        _isFetching = true;
      });
      AuthServices authServices = AuthServices();
      await authServices.signUp(newUserObj).then((value) {
        if (value == 201) {
          Navigator.pushNamed(context, ElectricBillListScreen.routeName);
        } else {
          setState(() {
            _isFetching = false;
          });
          print('Sign up failed');
        }
      }).catchError((err) {
        setState(() {
          _isFetching = false;
        });
        print(err);
      });
    } catch (err) {
      rethrow;
    }
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
                              .requestFocus(_usernameFocusNode),
                        ),
                        TextFormField(
                          focusNode: _usernameFocusNode,
                          initialValue: '',
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            icon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _username = value;
                            });
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Username is required";
                            } else if (value.length < 4) {
                              return "Username is too short";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
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
                        _isFetching
                            ? BuildSubmitButton(
                                title: 'Sign Up...',
                                bgColor: Colors.white,
                                txtColor: Colors.black45,
                                onPress: null)
                            : BuildSubmitButton(
                                title: 'Sign Up',
                                bgColor: Colors.blue,
                                txtColor: Colors.white,
                                onPress: _handleSubmit),
                        const SizedBox(
                          height: spaceExtraLarge,
                        ),
                        GestureDetector(
                          onTap: _isFetching
                              ? null
                              : () {
                                  Navigator.pushNamed(
                                      context, SignInScreen.routeName);
                                },
                          child: RichText(
                            text: TextSpan(
                                text: 'Already have an account?',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Sign In',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _isFetching
                                          ? Colors.grey
                                          : Theme.of(context).primaryColor,
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
