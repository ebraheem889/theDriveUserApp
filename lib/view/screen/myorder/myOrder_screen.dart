// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/data/model/body/card_body.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/view/screen/screens_from_darwer/myOrderScreens/activeOrder/activeOrder.dart';
import 'package:the_drive/view/screen/screens_from_darwer/myOrderScreens/potsOrder/postOrder.dart';
import 'package:the_drive/view/base/custom_appBar.dart';
import 'package:the_drive/view/widget/custom/custom_order_card.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

import 'widget/order_card.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CardBody> cardBody = [
      CardBody(
          onPressed: () {
            Get.to(() => ActiveOrderScreen());
          },
          titleLine1: "2 Cheesy Burger ",
          titleLine2: "2 Cheese Cake",
          titleLine3: "2 American Coffee",
          iconTitle: "1",
          logoTitle1: "assets/images/brgr.png",
          logoTitle2: "assets/images/Dolato.png",
          logoTitle3: "assets/images/Starbucks.png",
          date: "12-08-2022",
          price: "250 ",
          statusIcon1: "assets/icons/status_order.svg",
          statusIcon2: "assets/icons/status_order.svg",
          statusIcon3: "assets/icons/status_order.svg"),
      CardBody(
          onPressed: () {
            Get.to(() => PostOrderScreen());
          },
          titleLine1: "2 Cheesy Burger ",
          titleLine2: "2 Cheese Cake",
          titleLine3: "2 American Coffee",
          iconTitle: "2",
          logoTitle1: "assets/images/brgr.png",
          logoTitle2: "assets/images/Dolato.png",
          logoTitle3: "assets/images/Starbucks.png",
          date: "12-08-2022",
          price: "250 ",
          statusIcon1: "assets/icons/status_order.svg",
          statusIcon2: "assets/icons/status_order.svg",
          statusIcon3: "assets/icons/status_order.svg"),
      CardBody(
          onPressed: () {
            Get.to(() => PostOrderScreen());
          },
          titleLine1: "2 Cheesy Burger ",
          titleLine2: "2 Cheese Cake",
          titleLine3: "2 American Coffee",
          iconTitle: "2",
          logoTitle1: "assets/images/brgr.png",
          logoTitle2: "assets/images/Dolato.png",
          logoTitle3: "assets/images/Starbucks.png",
          date: "12-08-2022",
          price: "250 ",
          statusIcon1: "assets/icons/status_order.svg",
          statusIcon2: "assets/icons/status_order.svg",
          statusIcon3: "assets/icons/status_order.svg"),
    ];
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            22.ph,
            barApp(
              context,
              "myOrders".tr,
            ),
            56.ph,
            CustomTitle(
              title: "activeOrdersTitle".tr,
              titleColor: headTitleColor,
              fontSize: 20,
            ),
            14.ph,
            OrderCard(
              cardBody: cardBody[0],
            ),
            49.ph,
            CustomTitle(
              title: "pastOrderTitle".tr,
              titleColor: headTitleColor,
              fontSize: 20,
            ),
            14.ph,
            OrderCard(
              cardBody: cardBody[1],
            ),
            16.ph,
            OrderCard(
              cardBody: cardBody[2],
            ),
            16.ph,
            OrderCard(
              cardBody: cardBody[2],
            ),
          ],
        ),
      ),
    ));
  }
}
