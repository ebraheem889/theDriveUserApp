// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/app_constants.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool lang = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              22.ph,
              //app bar
              barApp(context, "setting".tr),
              81.ph,
              //change lang
              GestureDetector(
                onTap: () {
                  localizationController.setLanguage(Locale(
                    localizationController.isLtr
                        ? AppConstants.languages[1].languageCode
                        : AppConstants.languages[0].languageCode,
                    localizationController.isLtr
                        ? AppConstants.languages[1].countryCode
                        : AppConstants.languages[0].countryCode,
                  ));
                  localizationController
                      .setSelectIndex(localizationController.isLtr ? 1 : 0);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "changeLang".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    localizationController.isLtr
                        ? const Text(
                            "EN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        : const Text(
                            "عربي",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          )
                  ],
                ),
              ),
              32.ph,

              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getNewPasswordScreen());
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "changePassword".tr,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Image.asset(
                        "assets/images/changePasswordIcon.png",
                        height: 25,
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ),
              // end of change password

              32.ph,
              //logout
              GestureDetector(
                onTap: () {
                  //Get.toNamed(RouteHelper.getsignInPage());
                  Get.find<AuthController>().logout();
                  Get.offAllNamed(RouteHelper.getsignInPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "logOut".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    RotatedBox(
                      quarterTurns:
                          Get.find<LocalizationController>().isLtr ? 0 : -2,
                      child: Image.asset(
                        "assets/images/logOutIcon.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ),
              141.ph,
              Container(
                height: 298,
                child: Image.asset(
                  "assets/images/settingPic.png",
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}
