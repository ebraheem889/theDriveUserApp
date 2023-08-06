// ignore_for_file: file_names, non_constant_identifier_names, sized_box_for_whitespace

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/extensions.dart';

import 'package:the_drive/helper/route_hepler.dart';

import 'package:the_drive/view/widget/custom/customButton.dart';

Widget DrawerGustPage(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      const Spacer(),
      // image and name
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 122,
          width: 175,
          child: Image.asset("assets/images/rigerterAlarmImg.png"),
        ),
      ),
      // ignore: prefer_const_constructors
      24.ph,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        child: Text(
          "JoinThedriveFamilytoEnjoyOurservices".tr,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: greyColor),
        ),
      ),
      24.ph,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Text(
          "termsandconditions".tr,
          style: const TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),

      260.ph,
      Padding(
        padding: const EdgeInsets.only(left: 17.0),
        child: CustomButton(
          onPressed: ((() {
            // context.router.replace(SignUpRoute());
            Get.toNamed(RouteHelper.getSignUp());
          })),
          text: "Sign up",
        ),
      ),
      const Spacer(),
    ],
  );
}
