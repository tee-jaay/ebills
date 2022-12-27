import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  DividerLine(
    this.space,
    this.width,
    this.color, {
    Key? key,
  }) : super(key: key);

  double space;
  double width;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: space),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: color,
        width: width,
      ))),
    );
  }
}
