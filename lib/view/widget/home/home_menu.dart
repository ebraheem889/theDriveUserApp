// ignore_for_file: sized_box_for_whitespace

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/screen/screen_from_home/new_in_menu.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/home_offers_card.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    //items of CarouselSlider
    final List<Widget> images = [
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 171,
          width: 359,
          child: const HomeOfferCard(
            color: Color(0xFFC38C76),
            title: "Ice Cream",
            image: "assets/images/ice-cream.png",
            logo: "assets/images/Dolato.png",
            offer: "20",
            price: "79.99",
            productName: "Vanilla",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: GestureDetector(
          onTap: (() {
            // context.router.push(ProductDetailsRoute(pickType: 6));
          }),
          child: Container(
            height: 171,
            width: 359,
            child: const HomeOfferCard(
              height: 180,
              color: Color(0xFF262626),
              title: "Hot Dog",
              image: "assets/images/burger1.png",
              logo: "assets/images/brgr.png",
              offer: "15",
              price: "79.99",
              productName: "Double Dog",
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 171,
          width: 359,
          child: const HomeOfferCard(
            color: Color(0xFF00653D),
            title: "Ice Coffee",
            image: "assets/images/drink.png",
            logo: "assets/images/Starbucks.png",
            offer: "20",
            price: "79.99",
            productName: "Vanilla",
          ),
        ),
      ),
    ];
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
                    const SizedBox(
                      width: 8,
                    ),
                    RotatedBox(
                      quarterTurns: localNotifair.value == "ar" ? 2 : 0,
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
        const SizedBox(
          height: 20,
        ),
        CarouselSlider(
            items: images,
            options: CarouselOptions(
              height: 200,
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
            ))
      ],
    );
  }
}
