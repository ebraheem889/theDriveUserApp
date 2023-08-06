// ignore_for_file: file_names, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

// ignore: camel_case_types
class PostOrderScreen extends StatefulWidget {
  PostOrderScreen({Key? key}) : super(key: key);

  @override
  State<PostOrderScreen> createState() => _PostOrderScreenState();
}

class _PostOrderScreenState extends State<PostOrderScreen> {
  double ratingOrder = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          //app bar
          barApp(context, "pastOrderTitle".tr),
          const SizedBox(
            height: 42,
          ),
          //Order ID
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              children: [
                Text(
                  "orderId".tr,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Text(
                  " 17430986453",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: greyColor),
                ),
                const Spacer(),
                ratingOrder != 0.0
                    ? RatingBar.builder(
                        updateOnDrag: false,
                        glow: true,
                        itemSize: 20,
                        glowColor: Colors.white,
                        initialRating: ratingOrder,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: Colors.amber.withAlpha(130),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rate,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          rating = ratingOrder;
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          //in progress part
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                //logo and name and in progress point
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/brgr.png")),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "BRGR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 19,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/deliverdIcon.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "deliveredTitle".tr,
                              style: const TextStyle(
                                  fontSize: 12, color: DeliveredContantColor),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                //item and time and logo
                Row(
                  children: [
                    const Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child:
                            SvgPicture.asset("assets/icons/status_order.svg")),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    const Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    const SizedBox(
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
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                //logo and name and in progress point
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/brgr.png")),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "BRGR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 19,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/deliverdIcon.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "deliveredTitle".tr,
                              style: const TextStyle(
                                  fontSize: 12, color: DeliveredContantColor),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                //item and time and logo
                Row(
                  children: [
                    const Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    const SizedBox(
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
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                //logo and name and in progress point
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/brgr.png")),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      "BRGR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 19,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/deliverdIcon.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "deliveredTitle".tr,
                              style: const TextStyle(
                                  fontSize: 12, color: DeliveredContantColor),
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                //item and time and logo
                Row(
                  children: [
                    const Text(
                      "2 Cheesy Burger ",
                      style: TextStyle(
                          fontSize: 16,
                          color: inProgressContantColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "7 ${"min".tr}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                        height: 20,
                        width: 21,
                        child: SvgPicture.asset(
                            "assets/icons/inporgress_clock_icon.svg")),
                    const SizedBox(
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
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: greyColor),
              ),
              Text(
                "250 ${"egyptCurrency".tr}",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          //reorder and rating buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              mainAxisAlignment: ratingOrder == 0.0
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "reorderTitle".tr,
                  height: 56,
                  width: ratingOrder == 0.0 ? 131 : 237,
                ),
                ratingOrder == 0.0
                    ? CustomButton(
                        text: "rateButton".tr,
                        height: 56,
                        width: 131,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                      Text(
                                        "rateButton".tr,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: inProgressContantColor),
                                      ),
                                      const SizedBox(
                                        height: 55,
                                      ),
                                      RatingBar.builder(
                                        glow: true,
                                        itemSize: 30,
                                        glowColor: Colors.white,
                                        initialRating: ratingOrder,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        unratedColor:
                                            Colors.amber.withAlpha(130),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star_rate,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          setState(() {
                                            ratingOrder = rating;
                                          });
                                          print(rating);
                                        },
                                      ),
                                      const SizedBox(
                                        height: 81,
                                      ),
                                      CustomButton(
                                        text: "rateButtonsubmit".tr,
                                        height: 49,
                                        width: 178,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24)),
                                );
                              });
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
