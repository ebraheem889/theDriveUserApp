// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        // app bar of page
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: RotatedBox(
                      quarterTurns: localNotifair.value == "ar" ? -2 : 0,
                      child:
                          SvgPicture.asset("assets/icons/blue_arrow_back.svg")),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                SizedBox(
                    height: 105,
                    child: localNotifair.value == "en"
                        ? Image.asset("assets/images/notification_img.png")
                        : Image.asset("assets/images/arabic-notification.png")),
              ],
            ),
            Center(
                child: Text(
              "notification".tr,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
            )),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        //selected categories line
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Container(
            height: 32,
            decoration: BoxDecoration(
                color: const Color(0xFF767680).withOpacity(.12),
                borderRadius: BorderRadius.circular(7)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Row(
                children: [
                  //All
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: textButtonColors,
                      ),
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    height: 27,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Center(
                        child: Text(
                      "allNotification".tr,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ),
                  //Orders
                  Container(
                    // decoration: BoxDecoration(
                    //   // gradient: LinearGradient(
                    //   //   begin: Alignment.topCenter,
                    //   //   end: Alignment.bottomCenter,
                    //   //   colors: textButtonColors,
                    //   // ),
                    //   // color: buttonColor,
                    //   borderRadius: BorderRadius.circular(7),
                    //
                    // ),
                    height: 27,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Center(
                        child: Text(
                      "orderNotification".tr,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    )),
                  ),
                  //vertical divider
                  Container(
                    height: 15,
                    decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 1, color: Color(0xff8E8E93))),
                    ),
                  ),
                  //offers
                  Container(
                    // decoration: BoxDecoration(
                    //   // gradient: LinearGradient(
                    //   //   begin: Alignment.topCenter,
                    //   //   end: Alignment.bottomCenter,
                    //   //   colors: textButtonColors,
                    //   // ),
                    //   // color: buttonColor,
                    //   borderRadius: BorderRadius.circular(7),
                    //
                    // ),
                    height: 27,
                    width: MediaQuery.of(context).size.width / 3.5,
                    child: Center(
                        child: Text(
                      "offers".tr,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        //first notification
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Your Order Is Ready ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("assets/images/orderReady.png"),
                    ],
                  ),
                  const Text(
                    "Head To Dolato Station Now",
                    style: TextStyle(
                        fontSize: 14, color: notificationColorContant),
                  ),
                ],
              ),
              CustomButton(
                text: "view".tr,
                height: 37,
                width: 93,
                fontSize: 16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //second notification
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Your Order Is Ready ",
                        style: TextStyle(
                            fontSize: 16,
                            color: notificationColorContant,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("assets/images/orderReady.png"),
                    ],
                  ),
                  const Text(
                    "Head To Dolato Station Now",
                    style: TextStyle(
                        fontSize: 14, color: notificationColorContant),
                  ),
                ],
              ),
              CustomButton(
                text: "view".tr,
                height: 37,
                width: 93,
                fontSize: 16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //third notification
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "You Got 100 Points  ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("assets/images/gift.png"),
                    ],
                  ),
                  const Text(
                    "Check Your Wallet",
                    style: TextStyle(
                        fontSize: 14, color: notificationColorContant),
                  ),
                ],
              ),
              CustomButton(
                text: "view".tr,
                height: 37,
                width: 93,
                fontSize: 16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        //forth notification
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "New Starbucks Offers   ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset("assets/images/new_offer.png"),
                    ],
                  ),
                  const Text(
                    "Check Offers Now!",
                    style: TextStyle(
                        fontSize: 14, color: notificationColorContant),
                  ),
                ],
              ),
              CustomButton(
                text: "view".tr,
                height: 37,
                width: 93,
                fontSize: 16,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
