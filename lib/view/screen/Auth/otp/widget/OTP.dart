// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names, avoid_print, unnecessary_string_interpolations

import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as lt;
import 'package:pinput/pinput.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/cubit.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/states.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/timer.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/screen/home/home.dart';

class OtpWidget extends StatefulWidget {
  String toGoScreen;
  OtpWidget({required this.toGoScreen});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final timeController = CountDownController(const Duration(seconds: 70));
  bool isPinValid = false;
  late int _start;
  late Timer countDown;
  void _timerCallBack(Timer ticker) {
    if (_start == 0) {
      ticker.cancel();
    } else {
      _start--;
    }
    setState(() {});
  }

  void _resendCode(RegisterController controller) {
    setState(() {
      pinController.text = '';
    });
    controller.resendPinCode();

    if (countDown.isActive) countDown.cancel();
    _start = const Duration(minutes: 1).inSeconds;
    countDown = Timer.periodic(const Duration(seconds: 1), _timerCallBack);
    setState(() {});
  }

  void _initTimer() {
    _start = const Duration(seconds: 70).inSeconds;
    countDown = Timer.periodic(const Duration(seconds: 1), _timerCallBack);
  }

  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  @override
  void dispose() {
    if (countDown.isActive) countDown.cancel();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = greyColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return GetBuilder<RegisterController>(builder: (registerController) {
      return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //OTP Fields
            Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(
                  children: [
                    Pinput(
                      length: 6,
                      controller: pinController,
                      focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) async {
                        registerController.setPincode(pin: pin);
                        _checkPinCode(registerController);
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(() {
                      return registerController.isOtpValid.value == true
                          ? Container()
                          : Container(
                              child: Row(
                                children: const [
                                  Text(
                                    "Wrong Pin Code !",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  )
                                ],
                              ),
                            );
                    })
                  ],
                ),
              ),
            ),
            //Timer

            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _start == 0 ? _resendCode(registerController) : null;
                        },
                        child: const Text(
                          "Resend code in : ",
                          style: TextStyle(fontSize: 13, color: greyColor),
                        ),
                      ),
                      Text(
                          lt.DateFormat('mm:ss').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  _start * 1000)),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor)),
                      // Text(
                      //   "${timeController.formattedTime}",
                      //   style: TextStyle(
                      //       fontSize: 13,
                      //       fontWeight: FontWeight.w500,
                      //       color: Theme.of(context).primaryColor),
                      // ),
                    ],
                  ),
                  _start == 0
                      ? GestureDetector(
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            _resendCode(registerController);
                          },
                        )
                      : const Text(" "),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  void _checkPinCode(RegisterController registerController) async {
    registerController.checkPinCode().then((status) async {
      if (status.isSuccess) {
        print("success=========================>");
        if (widget.toGoScreen == RouteHelper.signIn) {
          Get.toNamed(RouteHelper.getLoginPage());
        } else {
          Get.toNamed(RouteHelper.getNewPasswordScreen());
        }
      }
    });
  }
}
