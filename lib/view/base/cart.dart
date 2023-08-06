import 'dart:developer';
import 'dart:ffi';

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
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/screen/main_bar_screen/cart.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

class cartView extends StatefulWidget {
  double height;
  double width;
  int counter1;
  int counter;
  double imgPositionTop;
  double imgPositionLeft;
  double imgPositionRight;
  double heighContainer;

  cartView(
      {this.height = 629,
      this.width = 242,
      this.counter = 0,
      this.counter1 = 0,
      this.imgPositionTop = 0,
      this.imgPositionLeft = 0,
      this.imgPositionRight = 0,
      this.heighContainer = 0});

  @override
  State<cartView> createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return SizedBox(
        height: 629,
        width: 242,
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Get.find<LocalizationController>().isLtr
                  ? Radius.circular(24)
                  : Radius.circular(0),
              bottomLeft: Get.find<LocalizationController>().isLtr
                  ? Radius.circular(24)
                  : Radius.circular(0),
              topRight: Get.find<LocalizationController>().isLtr
                  ? Radius.circular(0)
                  : Radius.circular(24),
              bottomRight: Get.find<LocalizationController>().isLtr
                  ? Radius.circular(0)
                  : Radius.circular(24),
            ),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Get.find<LocalizationController>().isLtr
                        ? const Radius.circular(24)
                        : const Radius.circular(0),
                    bottomLeft: Get.find<LocalizationController>().isLtr
                        ? const Radius.circular(24)
                        : const Radius.circular(0),
                    topRight: Get.find<LocalizationController>().isLtr
                        ? const Radius.circular(0)
                        : const Radius.circular(24),
                    bottomRight: Get.find<LocalizationController>().isLtr
                        ? const Radius.circular(0)
                        : const Radius.circular(24))),
            height: 629,
            width: 242,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    32.ph,
                    cartController.Items.isEmpty
                        ? Container(
                            height: 300,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Lottie.asset(
                                    'assets/icons/noproduct.json',
                                  ),
                                  const Text(
                                    "Empty Cart !",
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: 300,
                            child: ListView.builder(
                                itemCount: cartController.Items.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        boxShadow: const <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      height: 183,
                                      width: 245,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 13,
                                                ),
                                                SizedBox(
                                                    height: 57,
                                                    width: 106,
                                                    child: Text(
                                                      cartController
                                                          .CartList[index]
                                                          .itemName
                                                          .toString(),
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: textColor),
                                                    )),

                                                // end of product name
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                SizedBox(
                                                    height: 45,
                                                    width: 138,
                                                    child: Text(
                                                      cartController
                                                          .CartList[index]
                                                          .productDescription
                                                          .toString(),
                                                      maxLines: 2,
                                                      style: arabicmaincairoRegular
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: greyColor,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                    )),

                                                // end of product description
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 32,
                                                  width: 195,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        cartController
                                                            .CartList[index]
                                                            .itemPrice
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                cartPriceHomeContant),
                                                      ),
                                                      const SizedBox(
                                                        width: 61,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () => cartController
                                                            .addItemToCart(
                                                                cartController
                                                                        .CartList[
                                                                    index],
                                                                -1),
                                                        child: Container(
                                                          height: 24,
                                                          width: 24,
                                                          decoration: BoxDecoration(
                                                              color: cartController.getQuentity(
                                                                          cartController.CartList[
                                                                              index]) <=
                                                                      1
                                                                  ? DeleteColor
                                                                  : minsColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Center(
                                                              child: cartController.getQuentity(
                                                                          cartController.CartList[
                                                                              index]) <=
                                                                      1
                                                                  ? SvgPicture
                                                                      .asset(
                                                                      "assets/icons/deleteIcon.svg",
                                                                      height:
                                                                          18,
                                                                      width: 16,
                                                                    )
                                                                  : const Text(
                                                                      "-",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )),
                                                        ),
                                                      ),
                                                      // end of minus btn
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    9.0),
                                                        child: Text(
                                                          "${cartController.getQuentity(cartController.CartList[index])}",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'badg'),
                                                        ),
                                                      ),
                                                      // end of counter

                                                      GestureDetector(
                                                        onTap: () => cartController
                                                            .addItemToCart(
                                                                cartController
                                                                        .CartList[
                                                                    index],
                                                                1),
                                                        child: Container(
                                                          height: 24,
                                                          width: 24,
                                                          decoration: BoxDecoration(
                                                              color: minsColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: const Center(
                                                              child: Text(
                                                            "+",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                        ),
                                                      )
                                                      // end of add btn
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: Get.find<
                                                        LocalizationController>()
                                                    .isLtr
                                                ? 5
                                                : null,
                                            left: Get.find<
                                                        LocalizationController>()
                                                    .isLtr
                                                ? null
                                                : 5,
                                            child: Image.asset(
                                              "assets/images/drink2.png",
                                              height: 90,
                                              width: 60,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                          ),

                    45.ph,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${"total".tr} " +
                              cartController.getTotalFees().toString(),
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: dismissambleDelete),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "egyptCurrency".tr,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: dismissambleDelete),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // end of total price
                    20.ph,
                    //view card button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomButton(
                        text: "viewCart".tr,
                        width: 212,
                        height: 40,
                        onPressed: () {
                          Get.toNamed(RouteHelper.getCartScreen());
                        },
                      ),
                    ),

                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomButton(
                        //  onPressed: (() => getData.faweryPayment()),
                        text: "checkOut".tr,
                        width: 212,
                        height: 40,
                        buttonColor: lightSecondaryColor,
                      ),
                    ),
                    // end of check out btn
                    16.ph
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
