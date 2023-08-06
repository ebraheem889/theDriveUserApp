import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/screen/main_bar_screen/cart.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

Widget cartLayout(
    {context,
    height,
    width,
    counter1,
    counter,
    imgPositionTop,
    imgPositionLeft,
    imgPositionRight,
    double? heighContainer}) {
  return BlocConsumer<DriverCubit, DriveStates>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, DriveStates state) {
      DriverCubit getData = DriverCubit.get(context);
      return Positioned(
        top: height,
        left: localNotifair.value == "en" ? width : null,
        right: localNotifair.value == "ar" ? width : null,
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
                  topLeft: localNotifair.value == "en"
                      ? const Radius.circular(24)
                      : const Radius.circular(0),
                  bottomLeft: localNotifair.value == "en"
                      ? const Radius.circular(24)
                      : const Radius.circular(0),
                  topRight: localNotifair.value == "ar"
                      ? const Radius.circular(24)
                      : const Radius.circular(0),
                  bottomRight: localNotifair.value == "ar"
                      ? const Radius.circular(24)
                      : const Radius.circular(0))),
          height: heighContainer ?? 650,
          width: 240,
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  //first card
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    height: 183,
                    width: 225,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 13,
                              ),
                              const SizedBox(
                                  height: 57,
                                  width: 106,
                                  child: Text(
                                    "Lemon MintSmooth",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: textColor),
                                  )),
                              const SizedBox(
                                height: 12,
                              ),
                              const SizedBox(
                                  height: 40,
                                  width: 138,
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 12, color: greyColor),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 32,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "250 E£",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: cartPriceHomeContant),
                                    ),
                                    const SizedBox(
                                      width: 61,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: counter1 <= 1
                                              ? DeleteColor
                                              : minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: counter1 <= 1
                                              ? SvgPicture.asset(
                                                  "assets/icons/deleteIcon.svg",
                                                  height: 18,
                                                  width: 16,
                                                )
                                              : const Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 9.0),
                                      child: Text(
                                        "$counter1",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'badg'),
                                      ),
                                    ),
                                    //plus
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        "+",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: imgPositionTop,
                          left: localNotifair.value == "en"
                              ? imgPositionLeft
                              : null,
                          right: localNotifair.value == "ar"
                              ? imgPositionRight
                              : null,
                          child: Image.asset(
                            "assets/images/drink2.png",
                            height: 90,
                            width: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  // second card
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    height: 183,
                    width: 225,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 13,
                              ),
                              const SizedBox(
                                  height: 57,
                                  width: 106,
                                  child: Text(
                                    "Lemon MintSmooth",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: textColor),
                                  )),
                              const SizedBox(
                                height: 12,
                              ),
                              const SizedBox(
                                  height: 40,
                                  width: 138,
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 12, color: greyColor),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 32,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "250 E£",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: cartPriceHomeContant),
                                    ),
                                    const SizedBox(
                                      width: 61,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: counter <= 1
                                              ? DeleteColor
                                              : minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: counter <= 1
                                              ? SvgPicture.asset(
                                                  "assets/icons/deleteIcon.svg",
                                                  height: 18,
                                                  width: 16,
                                                )
                                              : const Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 9.0),
                                      child: Text(
                                        "$counter",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'badg'),
                                      ),
                                    ),
                                    //plus
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        "+",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: imgPositionTop,
                          left: localNotifair.value == "en"
                              ? imgPositionLeft
                              : null,
                          right: localNotifair.value == "ar"
                              ? imgPositionRight
                              : null,
                          child: Image.asset(
                            "assets/images/drink2.png",
                            height: 90,
                            width: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  //total price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${"total".tr} 225 ",
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
                  const SizedBox(
                    height: 20,
                  ),
                  //view card button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      text: "viewCart".tr,
                      width: 212,
                      height: 40,
                      onPressed: () {
                        navigatTo(
                            context,
                            CartScreen(
                              pickType: 3,
                            ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomButton(
                      onPressed: (() => getData.faweryPayment()),
                      text: "checkOut".tr,
                      width: 212,
                      height: 40,
                      buttonColor: lightSecondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
