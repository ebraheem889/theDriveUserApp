// ignore_for_file: sized_box_for_whitespace

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/new_in_menu_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/view/base/base_loader.dart';
import 'package:the_drive/view/screen/home/widget/home_offer_card.dart';
import 'package:the_drive/view/screen/screen_from_home/new_in_menu.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(
                title: "newInMenu".tr,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              const Spacer(),
              TextButton(
                child: Row(
                  children: [
                    Text(
                      "seeMore".tr,
                      style: const TextStyle(fontSize: 14),
                    ),
                    8.pw,
                    RotatedBox(
                      quarterTurns:
                          Get.find<LocalizationController>().isLtr ? 0 : 2,
                      child: SvgPicture.asset(
                        "assets/icons/see_more.svg",
                        width: 8,
                        height: 12,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  navigatTo(context, NewInMenuScreen());
                },
              ),
            ],
          ),
        ),
        20.ph,
        GetBuilder<NewInMenuController>(builder: ((newInMenuController) {
          return newInMenuController.isLoading ||
                  newInMenuController.newInMenuList.isEmpty
              ? AppLoader(
                  loaderView: CarouselSlider(
                      items: List.generate(
                          5,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Container(
                                  height: 171,
                                  width: 359,
                                  child: const HomeOfferCard(
                                    color: Color(0xFFC38C76),
                                    title: "",
                                    image: "assets/images/ice-cream.png",
                                    logo: "assets/images/Dolato.png",
                                    offer: "20",
                                    price: "",
                                    productName: "",
                                  ),
                                ),
                              )),
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                )
              : CarouselSlider(
                  items: List.generate(
                      newInMenuController.newInMenuList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Container(
                              height: 171,
                              width: 359,
                              child: HomeOfferCard(
                                color: Color(0xFFC38C76),
                                title: newInMenuController
                                    .newInMenuList[index].itemName
                                    .toString(),
                                image: "assets/images/ice-cream.png",
                                logo: "assets/images/Dolato.png",
                                offer: "20",
                                price: newInMenuController
                                    .newInMenuList[index].itemPrice
                                    .toString(),
                                productName: newInMenuController
                                    .newInMenuList[index].itemName
                                    .toString(),
                              ),
                            ),
                          )),
                  options: CarouselOptions(
                    height: 200,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ));
        }))
      ],
    );
  }
}
