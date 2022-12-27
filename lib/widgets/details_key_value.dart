import 'package:flutter/material.dart';

import '../constants.dart';

Widget DetailsKeyValue(String? title, String? value) {
  return Padding(
    padding: EdgeInsets.all(spaceSmall),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: TextStyle(
            fontSize: spaceExtraLarge,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: spaceExtraLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}