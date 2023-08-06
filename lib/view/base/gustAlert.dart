// ignore_for_file: non_constant_identifier_names, file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

Widget GustAlert(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    actionsAlignment: MainAxisAlignment.center,
    actionsPadding: const EdgeInsets.only(bottom: 32),
    actions: [
      CustomButton(
        height: 47,
        width: 157,
        text: "Register Now",
        onPressed: (() {
          Get.toNamed(RouteHelper.getSignUp());
        }),
      ),
    ],
    title: const Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: SizedBox(
          height: 53,
          width: 170,
          child: Text("Join The Drive Family To Enjoy Our Services")),
    ),
    icon: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
      child: SizedBox(
          height: 150,
          width: 235,
          child: Image.asset("assets/images/rigerterAlarmImg.png")),
    ),
  );
}
