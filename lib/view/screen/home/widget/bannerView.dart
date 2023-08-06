import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/banner_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/base/base_loader.dart';

class BannerView extends StatefulWidget {
  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: ((bannerController) {
      return bannerController.isloading
          ? AppLoader(
              loaderView: SizedBox(
              width: context.width,
              height: context.width * 0.3,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  onPageChanged: (page, _) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  initialPage: 0,
                  height: context.height * 0.3,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index, int realIndex) =>
                    Image.asset(
                  "assets/images/ad.png",
                  width: context.width,
                  height: context.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ))
          : SizedBox(
              width: context.width,
              height: context.height * 0.3,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      onPageChanged: (page, _) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      initialPage: 0,
                      height: context.height * 0.3,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: bannerController.bannersList.length,
                    itemBuilder: (BuildContext context, int index,
                            int realIndex) =>
                        //todo:make it cashed image network
                        //       Image.network(
                        // bannerController.bannersList[index].imgPath.toString(),
                        Image.asset(
                      "assets/images/ad.png",
                      width: context.width,
                      height: context.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: DotsIndicator(
                      dotsCount: bannerController.bannersList.isEmpty
                          ? 1
                          : bannerController.bannersList.length,
                      position: _currentPage.toDouble(),
                      decorator: DotsDecorator(
                        spacing: const EdgeInsets.all(5.0).copyWith(bottom: 10),
                        size: const Size(8, 10),
                        activeSize: const Size(8, 12),
                      ),
                    ),
                  ),
                ],
              ),
            );
    }));
  }
}
