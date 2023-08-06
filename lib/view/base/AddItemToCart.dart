// ignore_for_file: non_constant_identifier_names, file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

import '../../controller/services/const/colors.dart';

Widget AddItemToCart(
  BuildContext context,
  pickUpIndex,
) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    actionsAlignment: MainAxisAlignment.center,
    actionsPadding: const EdgeInsets.only(bottom: 32),
    icon: Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 54),
      child: Lottie.asset("assets/icons/add_to_cart_animeted.json"),
    ),
    title: Column(
      children: [
        Text("itemAddedMsg".tr,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: inProgressContantColor)),
        Text("successfulyMsg".tr,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: inProgressContantColor)),
      ],
    ),
    actions: [
      CustomButton(
        text: "viewCart".tr,
        height: 49,
        width: 201,
        onPressed: () {
          Navigator.of(context).pop();
          Future.delayed(Duration(milliseconds: 180), (() {
            Get.toNamed(RouteHelper.getCartScreen());
          }));
        },
      ),
    ],
  );
}
