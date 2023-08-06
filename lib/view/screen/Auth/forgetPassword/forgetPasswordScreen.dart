// ignore_for_file: file_names, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/base/customPhoneNumber/custom_phone_field.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (registerController) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 22,
            ),
            barApp(context, "Forget  Password"),
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
                height: 19,
                child: Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 13, color: greyColor),
                )),
            const SizedBox(
              height: 10,
            ),
            CustomPhoneField(
              style: const TextStyle(
                fontSize: 13,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {
                _phoneNumberController.text = phone.completeNumber;
              },
            ),
            const Spacer(),
            CustomButton(
              text: "Next",
              onPressed: (() async {
                _forgetPassword(registerController);
              }),
            ),
            const SizedBox(
              height: 50,
            )
          ]),
        ),
      );
    });
  }

  void _forgetPassword(RegisterController registerController) async {
    registerController.forgetPassword().then((status) {
      if (status.isSuccess) {
        Get.toNamed(RouteHelper.getOtpScreen(
            destinationScreeen: RouteHelper.newPassword));
      } else {
        showCustomSnackBar(status.message);
      }
    });
  }
}
