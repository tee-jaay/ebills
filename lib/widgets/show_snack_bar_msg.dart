import 'package:flutter/material.dart';

class ShowSnackBarMsg  {
  static showSnackBarMsg(ctx, String text, Color color) {
    return ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          content: Text(
            text,
            style: TextStyle(color: color),
          )),
    );
  }
}
