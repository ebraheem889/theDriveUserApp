// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/screen/screens_from_darwer/myOrderScreens/activeOrder/activeOrder.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

Widget OrderInProgress(context) {
  return Column(
    children: [
      CustomTitle(
        title: "activeOrdersTitle".tr,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 202,
        width: 800,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            //set border radius more than 50% of height and width to make circle
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 10,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "12 Aug 22  01:36 PM",
                      style: TextStyle(fontSize: 12, color: lightPrimaryColor),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/inprogrss_point.svg'),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "inProgress".tr,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: inProgressColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Cheesy Burger, American coffee, Ice… ",
                  style: TextStyle(
                      fontSize: 16,
                      color: lightSecondaryColor,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 312,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/Betty.png"),
                      const SizedBox(
                        width: 12,
                      ),
                      Image.asset("assets/images/Betty.png"),
                      const SizedBox(
                        width: 12,
                      ),
                      Image.asset("assets/images/Betty.png"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/inporgress_clock_icon.svg"),
                    const SizedBox(
                      width: 9,
                    ),
                    CustomTitle(
                      title: "7 ${"min".tr}",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    CustomButton(
                      onPressed: (() =>
                          navigatTo(context, ActiveOrderScreen())),
                      text: "viewOrder".tr,
                      width: 107,
                      height: 41,
                      fontSize: 12,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
