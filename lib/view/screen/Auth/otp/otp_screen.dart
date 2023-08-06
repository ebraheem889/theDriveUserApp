// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/view/screen/Auth/otp/widget/OTP.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class OTPScreen extends StatelessWidget {
  String goingScreenName;
  OTPScreen({required this.goingScreenName});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (registerController) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
              ),
              barApp(context, "OTP Verification "),
              78.ph,
              Text(
                "Enter the code we sent to:",
                style: TextStyle(fontSize: 18, color: greyColor),
              ),
              Row(
                children: [
                  Text(
                    "(${registerController.countryCode}) ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    registerController.phoneNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              70.ph,
              OtpWidget(
                toGoScreen: goingScreenName,
              ),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
