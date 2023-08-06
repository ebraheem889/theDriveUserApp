// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class ActiveOrderScreen extends StatefulWidget {
  ActiveOrderScreen({Key? key}) : super(key: key);

  @override
  State<ActiveOrderScreen> createState() => _ActiveOrderScreenState();
}

class _ActiveOrderScreenState extends State<ActiveOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          //app bar
          barApp(context, "activeOrdersTitle".tr),
          const SizedBox(
            height: 42,
          ),
          //qr code img
          SizedBox(
              height: 128,
              width: 128,
              child: Image.asset("assets/images/Icon-qrcode.png")),
          const SizedBox(
            height: 46,
          ),
          //in progress part
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                //logo and name and in progress point
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/brgr.png")),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "BRGR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SizedBox(
                        height: 19,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/icons/inprogrss_point.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "inProgress".tr,
                              style: TextStyle(
                                  fontSize: 12, color: inProgressColor),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                //item and time and logo
                Row(
                  children: [
                    Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child:
                            SvgPicture.asset("assets/icons/status_order.svg")),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child:
                            SvgPicture.asset("assets/icons/status_order.svg")),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          //Ready part
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                //logo and name and in progress point
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/brgr.png")),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "BRGR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SizedBox(
                        height: 19,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/readypoint.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "readyProgressTitle".tr,
                              style: TextStyle(
                                  fontSize: 12, color: RedyContantColor),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                //item and time and logo
                Row(
                  children: [
                    Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child:
                            SvgPicture.asset("assets/icons/status_order.svg")),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          //Deliverd part
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                //logo and name and in progress point
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/brgr.png")),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "BRGR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SizedBox(
                        height: 19,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/deliverdIcon.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "deliveredTitle".tr,
                              style: TextStyle(
                                  fontSize: 12, color: DeliveredContantColor),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                //item and time and logo
                Row(
                  children: [
                    Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child:
                            SvgPicture.asset("assets/icons/status_order.svg")),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          //total amount
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "totalOrder".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: greyColor),
              ),
              Text(
                "250 ${"egyptCurrency".tr}",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
