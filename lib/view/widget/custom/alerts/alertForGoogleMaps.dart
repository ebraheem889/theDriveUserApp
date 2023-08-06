// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/lunchGoogleMaps.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

Widget checkLunchGoogleMaps(context) {
  return AlertDialog(
    title: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          "locationMsgPart1".tr,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: inProgressContantColor),
        ),
        Text(
          "locationMsgPart2".tr,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: inProgressContantColor),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 47,
          width: MediaQuery.of(context).size.width / 2,
          child: CustomButton(
            text: "locationButton".tr,
            onPressed: () {
              Navigator.pop(context);
              MapUtils.openMap();
            },
          ),
        )
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );
}
