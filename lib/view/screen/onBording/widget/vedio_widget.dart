// ignore_for_file: sized_box_for_whitespace

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:lottie/lottie.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController? controller;
  final bool isLogged;

  const VideoWidget(
      {Key? key, required this.controller, required this.isLogged})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(
          widget.controller!,
        ),
        widget.isLogged
            ? SizedBox()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      // context.router.replace(SignUpRoute());
                      Get.toNamed(RouteHelper.getSignUp());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: buttonColor.withOpacity(.6),
                          borderRadius: BorderRadius.circular(10)
                          //more than 50% of width makes circle
                          ),
                      width: MediaQuery.of(context).size.width / 2,
                      height: 46,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 44,
                          ),
                          Text(
                            "skip".tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Transform.rotate(
                            angle: Get.find<LocalizationController>().isLtr
                                ? -math.pi / 2
                                : math.pi / 2,
                            child: Container(
                                width: 26,
                                height: 26,
                                child: Lottie.asset(
                                    'assets/icons/skip_arrow.json')),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      ],
    );
  }
}
