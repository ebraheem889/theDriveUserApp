// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison, non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable, avoid_print, sized_box_for_whitespace
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fawry_sdk/fawry_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/services/dissimisable_helper.dart';
import 'package:the_drive/data/model/body/fawry_model.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/util/images.dart';
import 'package:the_drive/view/widget/custom/alerts/checkOutByVisa.dart';
import 'package:the_drive/view/widget/custom/alerts/scanQrCodeAlert.dart';

import '../../../controller/pay_gateway_controller.dart';
import '../../../data/model/body/cart_item.dart';
import 'widget/cart_Item_view.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _loadCartList();
  }

  void _loadCartList() async {
    await Get.find<CartController>().setCarListFromLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: ((cartController) {
      return Scaffold(
        appBar: _CartPageAppBar(),
        body: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            40.ph,
            cartController.Items.isEmpty
                ? Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: context.height / 2,
                              child: Lottie.asset(
                                'assets/icons/noproduct.json',
                              ),
                            ),
                            const Text(
                              "Empty Cart !",
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartController.Items.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: DismissibleHelper(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: ((direction) {
                                  cartController.removeIfDissmissable(
                                      cartController.getAllCartItems()[index]);
                                }),
                                background: Container(
                                  height: 131,
                                  width: 111,
                                  decoration: BoxDecoration(
                                      color: dismissambleDelete,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          height: 27,
                                          width: 21,
                                          child: const Icon(Icons.delete,
                                              color: Colors.white)),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ),
                                child: CartItemView(
                                  ItemData:
                                      cartController.getAllCartItems()[index],
                                )),
                          );
                        })),
                  )
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 109,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 109,
                    width: 376,
                    child: GestureDetector(
                      onTap: () {
                        //==============================>cart dialog here
                        // if (widget.pickType == 1) {
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return scanQrCodeWidget(context);
                        //       });
                        // } else {
                        //   // getData.faweryPayment();
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return checkOutByVisa(context);
                        //       });
                        // }
                      },
                      child: Container(
                        height: 52,
                        width: 340,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: textButtonColors,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${cartController.getTotalFees().toString()}"
                                " ${"egyptCurrency".tr}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 128,
                              ),
                              Text(
                                "checkOut".tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GetBuilder<PaymentController>(
                                  builder: ((controller) {
                                // create new instance for fawry model
                                var reciete = FawryModel(
                                    billItemId: controller.generateUuid(),
                                    billDescription: "Description To Write ",
                                    billQuantity: 1,
                                    billPrice: cartController.getTotalFees(),
                                    customerName: "The Drive",
                                    customerEmail: "Drive@gmail.com",
                                    customerMobile: "+201061464012",
                                    merchantRefNum:
                                        FawryUtils.randomAlphaNumeric(10));
                                return GestureDetector(
                                    onTap: () {
                                      controller.fawryPay(fawryModel: reciete);
                                    },
                                    child: RotatedBox(
                                        quarterTurns:
                                            Get.find<LocalizationController>()
                                                    .isLtr
                                                ? 0
                                                : -2,
                                        child: SvgPicture.asset(
                                            "assets/icons/arrow-right.svg")));
                              }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  AppBar _CartPageAppBar() {
    return AppBar(
        centerTitle: true,
        title: Text(
          "cartPageTitle".tr,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
        ),
        leading: IconButton(
            icon: RotatedBox(
                quarterTurns: Get.find<LocalizationController>().isLtr ? 0 : -2,
                child: SvgPicture.asset("assets/icons/blue_arrow_back.svg")),
            onPressed: (() {
              Get.back();
            })));
  }
}
