import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EBR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
