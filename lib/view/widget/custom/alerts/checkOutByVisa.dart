// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

Widget checkOutByVisa(BuildContext context) {
  return AlertDialog(
    icon:
        Lottie.asset('assets/icons/checkouticon.json', height: 124, width: 124),
    title: Column(
      children: [
        Text(
          "orderSubmittedTitle".tr,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: inProgressContantColor),
        ),
        Text(
          "successfulyMsg".tr,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: inProgressContantColor),
        ),
        const SizedBox(
          height: 21,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "transactionNumber".tr,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),
            ),
            const Text(
              " 9456 ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: inProgressContantColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "amount".tr,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),
            ),
            Text(
              " 200 ${"egyptCurrency".tr} ",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: inProgressContantColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "paidBy".tr,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: greyColor),
            ),
            const Text(
              " Visa",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: inProgressContantColor),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            text: "discoverButton".tr,
            height: 47,
            width: MediaQuery.of(context).size.width / 2,
            onPressed: (() {
              Navigator.pop(context);
              //  context.router.replace(HomeRoute());
            })),
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );
}
