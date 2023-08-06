// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

Widget orderCard(
    {context,
    VoidCallback? onPressed,
    titleLine1,
    titleLine2,
    titleLine3,
    String? price,
    iconTitle,
    logoTitle1,
    logoTitle2,
    logoTitle3,
    date,
    statusIcon1,
    statusIcon2,
    statusIcon3}) {
  return Container(
    height: 220,
    width: 800,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        //set border radius more than 50% of height and width to make circle
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: Colors.black26,
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //in progress or deliverd
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: greyColor),
                ),
                const Spacer(),
                iconTitle == 1
                    ? SvgPicture.asset('assets/icons/inprogrss_point.svg')
                    : SvgPicture.asset("assets/icons/deliverd_icon.svg"),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  iconTitle == 1 ? "inProgress".tr : "deliveredTitle".tr,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: iconTitle == 1
                          ? inProgressColor
                          : DeliverdContantColor),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            //first line
            Container(
              height: 24,
              child: Row(
                children: [
                  Text(
                    titleLine1,
                    style: const TextStyle(
                        color: inProgressContantColor, fontSize: 16),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(logoTitle1),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(statusIcon1),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            //second line
            Container(
              height: 24,
              child: Row(
                children: [
                  Text(
                    titleLine2,
                    style: const TextStyle(
                        color: inProgressContantColor, fontSize: 16),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(logoTitle2),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(statusIcon2),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            //third line
            Container(
              height: 24,
              child: Row(
                children: [
                  Text(
                    titleLine3,
                    style: const TextStyle(
                        color: inProgressContantColor, fontSize: 16),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(logoTitle3),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(statusIcon3),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            //price and view order button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitle(
                  title: price! + "egyptCurrency".tr,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  titleColor: lightPrimaryColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                //ratting
                iconTitle != 1
                    ? RatingBar.builder(
                        glow: true,
                        itemSize: 20,
                        glowColor: Colors.white,
                        initialRating: 3,
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
                          print(rating);
                        },
                      )
                    : const Text(""),
                const Spacer(),
                CustomButton(
                  onPressed: onPressed,
                  text: iconTitle == 1 ? "viewOrder".tr : "reorderTitle".tr,
                  width: 89,
                  height: 41,
                  fontSize: 12,
                ),
                const SizedBox(
                  height: 17,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
