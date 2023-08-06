// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/widget/cart/scan_qr.dart';

Widget scanQrCodeWidget(context) {
  return AlertDialog(
    icon: Lottie.asset('assets/icons/die_in_alert_icon.json'),
    title: Column(
      children: [
        Text(
          "qrDialogTitle".tr,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: inProgressContantColor),
        ),
        const SizedBox(
          height: 21,
        ),
        Container(
            height: 55,
            width: 180,
            child: Text(
              "qrDialogSubTitle".tr,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),
              maxLines: 2,
            )),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            navigatTo(context, ScanQRScreen());
          },
          child: Container(
            height: 45,
            width: 172,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: textButtonColors,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "qrDialogButton".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );
}
