// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:the_drive/controller/services/const/colors.dart';

Widget SizeIcon({
  bool isSelected = false,
  String? sizeTitle,
}) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? lightSecondaryColor : borderColor,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Center(
          child: Text(
        sizeTitle!,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      )),
    ),
  );
}
