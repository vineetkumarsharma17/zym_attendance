import 'package:flutter/material.dart';

import '../constants/theme.dart';

buildTextFieldLabel(String text, [bool isRequired = true]) {
  return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          text,
          style: AppTextStyle.text.copyWith(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          width: 2,
        ),
        isRequired
            ? Image.asset(
                "assets/images/required.png",
                height: 10,
                width: 10,
              )
            : const SizedBox(),
      ]));
}
