// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/base/custom_text_field.dart';
import 'package:the_drive/view/screen/home/widget/home_offer_card.dart';
import 'package:the_drive/view/widget/cart/scan_qr.dart';
import 'package:the_drive/view/widget/custom/alerts/scanQrCodeAlert.dart';

class addCard extends StatefulWidget {
  addCard({
    Key? key,
  }) : super(key: key);

  @override
  State<addCard> createState() => _addCardState();
}

class _addCardState extends State<addCard> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    _cardexpController
        .addListener((() => _onControllerChanged(_cardexpController)));
    _cardcvController
        .addListener((() => _onControllerChanged(_cardcvController)));
  }

  void _onControllerChanged(TextEditingController controller) {
    {
      final text = controller.text;
      final newText = _insertSlash(text);
      if (newText != text) {
        controller.value = controller.value.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }
  }

  FocusNode _cardNumberFocus = FocusNode();
  FocusNode _cardexeFocus = FocusNode();
  FocusNode _cardcvFocus = FocusNode();
  FocusNode _cardnameFocus = FocusNode();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardexpController = TextEditingController();
  TextEditingController _cardcvController = TextEditingController();
  TextEditingController _cardnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "add_card".tr,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
        ),
        leading: IconButton(
          icon: RotatedBox(
              quarterTurns: Get.find<LocalizationController>().isLtr ? 0 : -2,
              child: SvgPicture.asset("assets/icons/blue_arrow_back.svg")),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // app bar of page

            40.ph,
            Container(
              height: context.height / 2.2,
              child: Stack(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      height: context.height / 3.5,
                      width: context.width / 1.1,
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
                              padding: EdgeInsets.only(top: 11.8, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    _cardNumberController.text.isEmpty ||
                                            _cardNumberController.text.length <
                                                4
                                        ? "0000"
                                        : _cardNumberController.text
                                            .substring(0, 4),
                                    style: mainregular.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  16.pw,
                                  Text(
                                    _cardNumberController.text.isEmpty ||
                                            _cardNumberController.text.length <
                                                8
                                        ? "0000"
                                        : _cardNumberController.text
                                            .substring(4, 8),
                                    style: mainregular.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  16.pw,
                                  Text(
                                    (_cardNumberController.text.isEmpty ||
                                            _cardNumberController.text.length <
                                                12)
                                        ? "0000"
                                        : _cardNumberController.text
                                            .substring(8, 12),
                                    style: mainregular.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  16.pw,
                                  Text(
                                    (_cardNumberController.text.isEmpty ||
                                            _cardNumberController.text.length <
                                                16)
                                        ? "0000"
                                        : _cardNumberController.text
                                            .substring(11),
                                    style: mainregular.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  16.pw,
                                ],
                              ),
                            ),
                            // end of card number
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
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    120.pw,
                                    Text(
                                      "Expiry Date",
                                      style: mainregular.copyWith(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // end of card holder and expiry date
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              child: Row(
                                children: [
                                  13.pw,
                                  Container(
                                    width: 165,
                                    child: Text(
                                      _cardnameController.text.isEmpty
                                          ? "xxxxxxxxxxxxx"
                                          : _cardnameController.text,
                                      style: mainMeduim.copyWith(
                                          color: Colors.white,
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  84.pw,
                                  Container(
                                    width: 90,
                                    child: Text(
                                      _cardexpController.text.isEmpty
                                          ? "00/00"
                                          : _cardexpController.text,
                                      style: mainMeduim.copyWith(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            16.ph
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: context.height / 3.7,
                      left: context.width / 3.1,
                      right: context.width / 3.1,
                      child: GestureDetector(
                        onTap: () async {
                          // Get.to(() => BarcodeScannerView());
                          _requestCameraPermission();
                        },
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0, // soften the shadow
                                offset: Offset(
                                  2.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/Icon ionic-ios-camera.svg"),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Scan Card",
                                  style: mainMeduim.copyWith(
                                      color: Color(0xff4A70B4), fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            22.ph,
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    "Card Number",
                    style: mainregular.copyWith(
                        fontSize: 13, color: Color(0xff45A080)),
                  ),
                )
              ],
            ),
            10.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: CustomTextField(
                  hintText: "Card Number",
                  controller: _cardNumberController,
                  focusNode: _cardNumberFocus,
                  inputType: TextInputType.number,
                  isNumber: true,
                  onSubmit: () {},
                  length: 16,
                  onChanged: (vaue) {
                    setState(() {});
                  },
                  prefixIcon: null),
            ),

            24.ph,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            "Expiration Date",
                            style: mainregular.copyWith(
                                fontSize: 13, color: Color(0xff45A080)),
                          ),
                        ),
                        10.ph,
                        Container(
                          width: 140,
                          height: 120,
                          child: CustomTextField(
                              hintText: "M M / Y Y",
                              controller: _cardexpController,
                              focusNode: _cardexeFocus,
                              onSubmit: () {},
                              inputType: TextInputType.number,
                              length: 5,
                              onChanged: (value) {
                                if ((RegExp(r'^\d{2}/\d{2}$'))
                                    .hasMatch(value!)) {
                                  setState(() {});
                                }
                              },
                              prefixIcon: null),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            "Cv / CVC",
                            style: mainregular.copyWith(
                                fontSize: 13, color: Color(0xff45A080)),
                          ),
                        ),
                        10.ph,
                        Container(
                          width: 140,
                          height: 120,
                          child: CustomTextField(
                              hintText: "M M / Y Y",
                              controller: _cardcvController,
                              focusNode: _cardcvFocus,
                              length: 5,
                              inputType: TextInputType.number,
                              onSubmit: () {},
                              onChanged: (value) {
                                if ((RegExp(r'^\d{2}/\d{2}$'))
                                    .hasMatch(value!)) {
                                  setState(() {});
                                }
                              },
                              prefixIcon: null),
                        ),
                      ],
                    )
                  ],
                )),
            24.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: CustomTextField(
                  hintText: "Card Holder Name",
                  controller: _cardnameController,
                  focusNode: _cardnameFocus,
                  onSubmit: () {},
                  onChanged: (vaue) {
                    setState(() {});
                  },
                  prefixIcon: null),
            ),

            24.ph,
            GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: Container(
                    width: context.width / 0.5,
                    height: 57,
                    decoration: BoxDecoration(
                        color: Color(0xff45A080),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add Card",
                        style: mainBold.copyWith(color: Colors.white),
                      ),
                    ),
                  )),
            ),
            24.ph,
          ],
        ),
      ),
    );
  }

  String _insertSlash(String text) {
    text = text.replaceAll('/', '');
    if (text.length > 2) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    return text;
  }

  void _requestCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {
    } else {
      // Permission denied
    }
  }
}
