import 'package:flutter/material.dart';

class CenterProgress extends StatelessWidget {
  const CenterProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
