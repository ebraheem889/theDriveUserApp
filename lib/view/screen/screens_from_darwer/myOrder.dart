// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/screen/screens_from_darwer/myOrderScreens/activeOrder/activeOrder.dart';
import 'package:the_drive/view/screen/screens_from_darwer/myOrderScreens/potsOrder/postOrder.dart';
import 'package:the_drive/view/base/custom_appBar.dart';
import 'package:the_drive/view/widget/custom/custom_order_card.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            barApp(
              context,
              "myOrders".tr,
            ),
            const SizedBox(
              height: 56,
            ),
            CustomTitle(
              title: "activeOrdersTitle".tr,
              titleColor: headTitleColor,
              fontSize: 20,
            ),
            const SizedBox(
              height: 14,
            ),
            orderCard(
                onPressed: () {
                  navigatTo(context, ActiveOrderScreen());
                },
                context: context,
                titleLine1: "2 Cheesy Burger ",
                titleLine2: "2 Cheese Cake",
                titleLine3: "2 American Coffee",
                iconTitle: 1,
                logoTitle1: "assets/images/brgr.png",
                logoTitle2: "assets/images/Dolato.png",
                logoTitle3: "assets/images/Starbucks.png",
                date: "12-08-2022",
                price: "250 ",
                statusIcon1: "assets/icons/status_order.svg",
                statusIcon2: "assets/icons/status_order.svg",
                statusIcon3: "assets/icons/status_order.svg"),
            const SizedBox(
              height: 49,
            ),
            CustomTitle(
              title: "pastOrderTitle".tr,
              titleColor: headTitleColor,
              fontSize: 20,
            ),
            const SizedBox(
              height: 14,
            ),
            orderCard(
                onPressed: () {
                  navigatTo(context, PostOrderScreen());
                },
                context: context,
                titleLine1: "2 Cheesy Burger ",
                titleLine2: "2 Cheese Cake",
                titleLine3: "2 American Coffee",
                iconTitle: 2,
                logoTitle1: "assets/images/brgr.png",
                logoTitle2: "assets/images/Dolato.png",
                logoTitle3: "assets/images/Starbucks.png",
                date: "12-08-2022",
                price: "250 ",
                statusIcon1: "assets/icons/status_order.svg",
                statusIcon2: "assets/icons/status_order.svg",
                statusIcon3: "assets/icons/status_order.svg"),
            const SizedBox(
              height: 16,
            ),
            orderCard(
                onPressed: () {
                  navigatTo(context, PostOrderScreen());
                },
                context: context,
                titleLine1: "2 Cheesy Burger ",
                titleLine2: "2 Cheese Cake",
                titleLine3: "2 American Coffee",
                iconTitle: 2,
                logoTitle1: "assets/images/brgr.png",
                logoTitle2: "assets/images/Dolato.png",
                logoTitle3: "assets/images/Starbucks.png",
                date: "12-08-2022",
                price: "250 ",
                statusIcon1: "assets/icons/status_order.svg",
                statusIcon2: "assets/icons/status_order.svg",
                statusIcon3: "assets/icons/status_order.svg"),
            const SizedBox(
              height: 16,
            ),
            orderCard(
                onPressed: () {
                  navigatTo(context, PostOrderScreen());
                },
                context: context,
                titleLine1: "2 Cheesy Burger ",
                titleLine2: "2 Cheese Cake",
                titleLine3: "2 American Coffee",
                iconTitle: 2,
                logoTitle1: "assets/images/brgr.png",
                logoTitle2: "assets/images/Dolato.png",
                logoTitle3: "assets/images/Starbucks.png",
                date: "12-08-2022",
                price: "250 ",
                statusIcon1: "assets/icons/status_order.svg",
                statusIcon2: "assets/icons/status_order.svg",
                statusIcon3: "assets/icons/status_order.svg"),
          ],
        ),
      ),
    ));
  }
}
