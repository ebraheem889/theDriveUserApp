// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';

PreferredSizeWidget barApp(
  BuildContext context,
  String text, {
  void Function()? widget,
  double? size,
  FontWeight? weight,
  Color? color,
  bool? center,
}) {
  return AppBar(
      centerTitle: center ?? true,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: size ?? 22,
              fontWeight: weight ?? FontWeight.bold,
              color: color ?? textColor,
            ),
      ),
      leading: GestureDetector(onTap: () {
        Get.back();
      }, child: GetBuilder<LocalizationController>(
        builder: (controller) {
          return Container(
            child: IconButton(
                icon: RotatedBox(
                    quarterTurns: controller.isLtr ? 0 : -2,
                    child:
                        SvgPicture.asset("assets/icons/blue_arrow_back.svg")),
                onPressed: (() {
                  Get.back();
                })),
          );
        },
      )));
}
