// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/config.dart';
import 'package:the_drive/view/base/custom_form_field.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/widget/custom/alerts/confirmChangePassWordScreen.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/customTextFormField.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordSecure = false;
  bool _isConfirmPasswordSecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<RegisterController>(builder: ((registerController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 22,
          ),
          barApp(context, "Forget  Password"),
          const SizedBox(
            height: 65,
          ),
          const Text(
            'New Password',
            style: TextStyle(fontSize: 13, color: greyColor),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomFormField(
            controller: _passwordController,
            textInputType: TextInputType.visiblePassword,
            maxlines: 1,
            hintLabel: "password".tr,
            isSecure: _isPasswordSecure,
            suffixIcon: IconButton(
              onPressed: () => _toggleIsSecure(true),
              icon: Icon(
                _isPasswordSecure ? Icons.visibility_off : Icons.visibility,
                color: lightPrimaryColor,
                size: 20,
              ),
            ),
            validate: (value) {
              final reg = Config.passwordRegExp;
              if (value == null || value.isEmpty) {
                return "requiredField".tr;
              } else if (!reg.hasMatch(value)) {
                return "easypassword".tr;
              }
              return null;
            },
          ),

          // end of new password
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Confirm Password ',
            style: TextStyle(fontSize: 13, color: greyColor),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomFormField(
            controller: _confirmPasswordController,
            textInputType: TextInputType.visiblePassword,
            maxlines: 1,
            hintLabel: "password".tr,
            isSecure: _isConfirmPasswordSecure,
            suffixIcon: IconButton(
              onPressed: () => _toggleIsSecure(false),
              icon: Icon(
                _isConfirmPasswordSecure
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: lightPrimaryColor,
                size: 20,
              ),
            ),
            validate: (value) {
              final reg = Config.passwordRegExp;
              if (value == null || value.isEmpty) {
                return "requiredField".tr;
              } else if (!reg.hasMatch(value)) {
                return "easypassword".tr;
              }
              return null;
            },
          ),

          // end of  confirme password
          const Spacer(),
          CustomButton(
            text: "Confirm",
            onPressed: () {
              _changePassword(registerController);
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ]),
      );
    })));
  }

  void _toggleIsSecure(bool isPassword) {
    if (isPassword) {
      setState(() {
        _isPasswordSecure = !_isPasswordSecure;
      });
    } else {
      setState(() {
        _isConfirmPasswordSecure = !_isConfirmPasswordSecure;
      });
    }
  }

  void _changePassword(RegisterController registerController) async {
    String _newPassword = _passwordController.text.trim();
    String _confirmPassword = _confirmPasswordController.text.trim();

    if (_newPassword != _confirmPassword) {
      showCustomSnackBar("Passwords are not identical ! ");
    } else {
      registerController
          .changePassword(
              newPassword: _newPassword, confirmPassword: _confirmPassword)
          .then((status) async {
        if (status.isSuccess) {
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return confirmAlert(context);
          //     });
          Get.offAllNamed(RouteHelper.getLoginPage());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}
