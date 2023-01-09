import 'package:flutter/material.dart';

class BuildSubmitButton extends StatelessWidget {
  BuildSubmitButton(
      {required this.title,
      required this.bgColor,
      required this.txtColor,
      required this.onPress,
      Key? key})
      : super(key: key);
  VoidCallback? onPress;
  String title;
  Color bgColor, txtColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          bgColor,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: txtColor,
        ),
      ),
    );
  }
}
