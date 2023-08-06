// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class AdsSlider extends StatefulWidget {
  const AdsSlider({Key? key}) : super(key: key);

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            onPageChanged: (page, _) {
              setState(() {
                _currentPage = page;
              });
            },
            initialPage: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index, int realIndex) => Image.asset(
            "assets/images/ad.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DotsIndicator(
            dotsCount: 3,
            position: _currentPage.toDouble(),
            decorator: DotsDecorator(
              spacing: const EdgeInsets.all(5.0).copyWith(bottom: 10),
              size: const Size(8, 10),
              activeSize: const Size(8, 12),
            ),
          ),
        ),
      ],
    );
  }
}
