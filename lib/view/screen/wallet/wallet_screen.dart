// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/screen/addcard/add_card_screen.dart';
import 'package:the_drive/view/screen/home/widget/home_offer_card.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          50.ph,
          // app bar of page
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: RotatedBox(
                        quarterTurns:
                            Get.find<LocalizationController>().isLtr ? 0 : -2,
                        child: SvgPicture.asset(
                            "assets/icons/blue_arrow_back.svg")),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                ],
              ),
              Center(
                  child: Text(
                "wallet".tr,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              )),
            ],
          ),

          40.ph,

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 138,
                  height: 167,
                  child: Stack(
                    children: [
                      Positioned(
                          left: Get.find<LocalizationController>().isLtr
                              ? -40
                              : null,
                          right: Get.find<LocalizationController>().isLtr
                              ? null
                              : 0,
                          child: Get.find<LocalizationController>().isLtr
                              ? SvgPicture.asset(
                                  "assets/icons/wallet_icon.svg",
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/icons/Mask Group 626.png",
                                  fit: BoxFit.cover,
                                ))
                    ],
                  )),
              39.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width / 2,
                    child: Text(
                      "total".tr,
                      style: mainBold.copyWith(
                          fontSize: 42, color: Color(0xff1B4081)),
                    ),
                  ),
                  SizedBox(
                    width: context.width / 2.4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: context.width / 5,
                          height: 56,
                          child: Text(
                            "100",
                            style: mainBold.copyWith(
                                fontSize: 42, color: Color(0xff45A080)),
                          ),
                        ),
                        SizedBox(
                          width: 22,
                          height: 30,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "E£",
                              style: mainregular.copyWith(
                                  fontSize: 14, color: Color(0xff45A080)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),

          50.ph,
          CarouselSlider(
              items: List.generate(
                  3,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Container(
                            height: 200,
                            width: 350,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: const [
                                    Color(0xcc00653D),
                                    Color(0xff06BFB6),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 11.8, right: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 30,
                                              child: Text(
                                                "THE",
                                                style: mainregular.copyWith(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/drive_icon_word.svg",
                                                fit: BoxFit.contain,
                                                width: 70,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 13.6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            16.pw,
                                            SvgPicture.asset(
                                              "assets/icons/cardScan.svg",
                                              width: 40,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                            13.2.pw,
                                            SvgPicture.asset(
                                              "assets/icons/Icon ionic-ios-wifi.svg",
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/bubbles.svg"),
                                            8.pw,
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10.6),
                                    child: Row(
                                      children: [
                                        Text(
                                          "1234",
                                          style: mainregular.copyWith(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        16.pw,
                                        Text(
                                          "1234",
                                          style: mainregular.copyWith(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        16.pw,
                                        Text(
                                          "5678",
                                          style: mainregular.copyWith(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        16.pw,
                                        Text(
                                          "4567",
                                          style: mainregular.copyWith(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        16.pw,
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 9, horizontal: 10),
                                    child: SizedBox(
                                      height: 20,
                                      child: Row(
                                        children: [
                                          15.pw,
                                          Text(
                                            "Card Holder Name",
                                            style: mainregular.copyWith(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          90.pw,
                                          Text(
                                            "Expiry Date",
                                            style: mainregular.copyWith(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    child: Row(
                                      children: [
                                        16.pw,
                                        Text(
                                          "Layla Farid",
                                          style: mainMeduim.copyWith(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        160.pw,
                                        Text(
                                          "06/23",
                                          style: mainMeduim.copyWith(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  // end of name
                                  16.ph
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),

          43.ph,

          GestureDetector(
            onTap: () {
              Get.to(() => addCard());
            },
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 17,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/addcard.svg"),
                    7.9.pw,
                    Text(
                      "add_card".tr,
                      style: mainMeduim.copyWith(
                          color: Color(0xff1B4081), fontSize: 18),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
