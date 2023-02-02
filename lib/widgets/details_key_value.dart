import 'package:flutter/material.dart';

import '../settings/constants.dart';

Widget detailsKeyValue(String? title, String? value) {
  return Padding(
    padding: const EdgeInsets.all(spaceSmall),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toString(),
          style: const TextStyle(
            fontSize: spaceExtraLarge,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: spaceExtraLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}