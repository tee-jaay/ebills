import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/constants.dart';
import '../../services/auth_services.dart';
import '../../providers/authentication.dart';
import '../../widgets/build_submit_button.dart';
import '../../widgets/show_snack_bar_msg.dart';
import '../../widgets/center_progress.dart';
import 'sign_up_screen.dart';
import '../electric_bill/electric_bill_list_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = authSignInScreenRouteName;

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email = '';
  late String _password = '';

  final _passwordFocusNode = FocusNode();

  Future<void> _handleSubmit() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }

    dynamic newUserObj = {"email": _email, "password": _password};

    try {
      Provider.of<AuthServices>(context, listen: false)
          .signIn(newUserObj)
          .then((value) {
        if (value == 200) {
          Navigator.pushNamed(context, ElectricBillListScreen.routeName);
        } else {
          ShowSnackBarMsg.showSnackBarMsg(
              context, 'Sign in failed', Colors.orange);
        }
      }).catchError((err) {
        if (kDebugMode) {
          print(err.toString());
        }
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthServices>(context, listen: true);

    return authProvider.isAuth ? ElectricBillListScreen() : Scaffold(
      body: Form(
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
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
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
                  authProvider.isLoading
                      ? BuildSubmitButton(
                          title: 'Sign In...',
                          bgColor: Colors.white,
                          txtColor: Colors.black45,
                          onPress: null)
                      : BuildSubmitButton(
                          title: 'Sign In',
                          bgColor: Colors.blue,
                          txtColor: Colors.white,
                          onPress: _handleSubmit),
                  const SizedBox(
                    height: spaceExtraLarge,
                  ),
                  GestureDetector(
                    onTap: authProvider.isLoading
                        ? null
                        : () {
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
                                color: authProvider.isLoading
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
