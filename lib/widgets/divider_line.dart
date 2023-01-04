import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  const DividerLine(
    this.space,
    this.width,
    this.color, {
    Key? key,
  }) : super(key: key);

  final double space;
  final double width;
  final Color color;

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
