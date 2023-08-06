// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/user_controller.dart';
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
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _cellPhoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordSecure = true;
  bool _isConfirmPasswordSecure = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    if (!Get.find<UserController>().isProfileDataLoadedBefore) {
      await Get.find<UserController>().getUserData();
      _cellPhoneController.text =
          Get.find<UserController>().userInfoData!.cellphonenum ?? '';
    } else {
      _cellPhoneController.text =
          Get.find<UserController>().userInfoData!.cellphonenum ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<UserController>(builder: ((userController) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
            child: Container(
              height: context.height,
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      barApp(context, "Change  Password"),
                      const SizedBox(
                        height: 65,
                      ),

                      Text(
                        'phoneNumberTitle'.tr,
                        style: TextStyle(fontSize: 13, color: greyColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        controller: _cellPhoneController,
                        textInputType: TextInputType.visiblePassword,
                        maxlines: 1,
                        isSecure: false,
                        readOnly: true,
                        hintLabel: "",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'old_password'.tr,
                        style: TextStyle(fontSize: 13, color: greyColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        controller: _oldPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        maxlines: 1,
                        hintLabel: "password".tr,
                        isSecure: _isPasswordSecure,
                        suffixIcon: IconButton(
                          onPressed: () => _toggleIsSecure(true),
                          icon: Icon(
                            _isPasswordSecure
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
                          }
                          return null;
                        },
                      ),

                      // end of old password
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'new_password'.tr,
                        style: TextStyle(fontSize: 13, color: greyColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        controller: _newPasswordController,
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
                          if (_formKey.currentState!.validate()) {
                            _changePassword(userController);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ]),
              ),
            ),
          ));
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

  void _changePassword(UserController userController) async {
    String _oldPassword = _oldPasswordController.text.trim();
    String _newPassword = _newPasswordController.text.trim();

    userController
        .changePassword(
            phoneNumber: _cellPhoneController.text,
            oldPassword: _oldPassword,
            newPassword: _newPassword)
        .then((status) async {
      if (status.isSuccess) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return confirmAlert(context);
            });
        _timer = Timer(Duration(seconds: 1), () {
          Navigator.of(context).pop();
          Get.back();
        });
      } else {
        showCustomSnackBar(status.message);
      }
    });
  }
}
