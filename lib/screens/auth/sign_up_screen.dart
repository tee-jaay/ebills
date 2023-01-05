import 'package:flutter/material.dart';

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

  final _isLoading = false;

  late String _email = '';
  late String _username = '';
  late String _password = '';

  final _emailFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  void _handleSubmit() {
    print('handle submit');
    print(_email);
    print(_username);
    print(_password);
    //Todo:  validate sign up & sign in
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
                              Theme.of(context).primaryColorDark,
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: spaceExtraLarge,
                        ),

                        GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, SignInScreen.routeName);
                            },
                            child: const Text(
                              'Already have an account? Sign In here',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            )
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
