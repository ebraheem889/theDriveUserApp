// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/function.dart';

const Color lightPrimaryColor = Color(0xFF45A080);
const Color lightSecondaryColor = Color(0xFF4A70B4);
const Color inProgressColor = Color(0xFF005CFF);
const Color inProgressContantColor = Color(0xFF1B4081);
const Color DeliverdContantColor = Color(0xFF16C123);
const Color minsColor = Color(0xFF4E9FCF);
const Color dismissambleDelete = Color(0xFFE85858);
const Color RedyContantColor = Color(0xFF15C12E);
const Color DeliveredContantColor = Color(0xFFAC1E1E);
const Color cartPriceHomeContant = Color(0xFF06BFB6);
const Color DeleteColor = Color(0xFFDB2D2D);
// static const Color lightAccentColor = Color(0xFF8ea1ff);
const Color borderColor = Color(0xFF07D3C9);
const Color greyColor = Color(0xFF6C6C6C);
const Color greyColorBorder = Color(0xFFE1E1E1);
const Color greyColorText = Color(0xFFC6C6C9);
const Color errorColor = Color(0xFFDE0000);
const Color textColor = Color(0xFF00653D);
const Color notificationColorContant = Color(0xff535353);
const List<Color> textButtonColors = [
  Color(0xFF45A080),
  Color(0xFF00B8AD),
];
const buttonColor = Color(0xff45A080);
const headTitleColor = Color(0xff06BFB6);

const Color redColor = Color(0xFFBA2619);
const Color orangeColor = Color(0xFFD99036);

ThemeData lightTheme(String local) {
  return ThemeData(
    fontFamily:
        Get.find<LocalizationController>().isLtr ? "main" : 'arabic-main-cairo',
    textTheme: const TextTheme().apply(
      fontSizeFactor: 2,
      fontFamily: Get.find<LocalizationController>().isLtr
          ? "main"
          : 'arabic-main-cairo',
    ),
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: const Color(0xFFF2F5F9),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: lightPrimaryColor,
      ),
      titleTextStyle: TextStyle(
        color: lightPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    ),
    platform: TargetPlatform.iOS,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightSecondaryColor,
      primary: lightPrimaryColor,
    ),
  );
}
