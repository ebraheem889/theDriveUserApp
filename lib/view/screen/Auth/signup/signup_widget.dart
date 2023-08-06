// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_print

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/cubit.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/states.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/data/model/body/user_body.dart';
import 'package:the_drive/data/shared/enums.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/config.dart';
import 'package:the_drive/view/base/customPhoneNumber/custom_phone_field.dart';
import 'package:the_drive/view/base/custom_drop_down.dart';
import 'package:the_drive/view/base/custom_form_field.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/base/custom_text_field.dart';
import 'package:the_drive/view/screen/Auth/verification/verification_screen.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/customTextFormField.dart';
import 'package:intl/intl.dart' as intl;
import 'package:the_drive/view/widget/custom/custom_title.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _TermsAndConditionsController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _genderFocus = FocusNode();
  final FocusNode _BirthDateFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _termsFocus = FocusNode();

  bool _isSecure = true;

  final genderList = <String>['male', 'female'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    _userNameController.text = "";
    _phoneNumberController.text = "";
    _genderController.text = "";
    _birthDateController.text = "";
    _TermsAndConditionsController.text = "";
    _mailController.text = "";
    _passwordController.text = "";
  }

  String? dropdownValue;
  bool _isAcceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (registercontroller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    //

                    CustomTitle(
                      title: "GET STARTED",
                      fontSize: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                        height: 19,
                        width: 90,
                        child: Text(
                          "username".tr,
                          style: TextStyle(fontSize: 13, color: greyColor),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    CustomFormField(
                      controller: _userNameController,
                      textInputType: TextInputType.name,
                      maxlines: 1,
                      hintLabel: "username".tr,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "requiredField".tr;
                        } else if (value.length < 3) {
                          return "Short Name !";
                        } else {
                          return null;
                        }
                      },
                    ),

                    // end of user name

                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                        height: 19,
                        width: 90,
                        child: Text(
                          "email".tr,
                          style: TextStyle(fontSize: 13, color: greyColor),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    CustomFormField(
                      controller: _mailController,
                      textInputType: TextInputType.name,
                      maxlines: 1,
                      hintLabel: "email".tr,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "requiredField".tr;
                        } else if (!Config.emailRegExp.hasMatch(value)) {
                          return "invalidmail".tr;
                        } else {
                          return null;
                        }
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // end of mail
                    SizedBox(
                        height: 19,
                        child: Text(
                          "phonenumber".tr,
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 18),
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
                    // end of pohone number Controller

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // gender
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 1,
                              ),
                              SizedBox(
                                  height: 19,
                                  child: Text(
                                    'gender'.tr,
                                    style: TextStyle(
                                        fontSize: 13, color: greyColor),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 58,
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                  hint: Text(
                                    "genderTitle".tr,
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  value: dropdownValue,
                                  items: genderList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    _genderController.text = value.toString();
                                    log("Gender Is " + value.toString());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // end of gender
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 1,
                              ),
                              SizedBox(
                                  height: 19,
                                  child: Text(
                                    'Birthdate'.tr,
                                    style: TextStyle(
                                        fontSize: 13, color: greyColor),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                                minLines: 1,
                                onChanged: (value) {
                                  _birthDateController.text = value;
                                },
                                controller: _birthDateController,
                                decoration: InputDecoration(
                                  suffixIcon: SizedBox(
                                    // height: 8,
                                    width: 9,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/data_icon.svg",
                                        ),
                                      ],
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(),
                                  ),
                                  hintStyle: const TextStyle(
                                      fontSize: 10, color: greyColor),
                                  hintText: "DD/MM/YYYY",
                                ),
                                onTap: () async {
                                  DateTime? date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2150));
                                  String formattedDate =
                                      intl.DateFormat('yyyy-MM-dd')
                                          .format(date!);

                                  _birthDateController.text =
                                      formattedDate.toString();
                                  print(formattedDate);
                                },
                              )
                            ],
                          ),
                        ),
                        // end of date
                      ],
                    ),
                    // end of gender and birth date controllers

                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 19,
                        child: Text(
                          'password'.tr,
                          style: TextStyle(fontSize: 13, color: greyColor),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    CustomFormField(
                      controller: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                      maxlines: 1,
                      hintLabel: "password".tr,
                      isSecure: _isSecure,
                      suffixIcon: IconButton(
                        onPressed: () => _toggleSecure(),
                        icon: Icon(
                          _isSecure ? Icons.visibility_off : Icons.visibility,
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
                    // end of password controller
                    Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Checkbox(
                              activeColor: lightPrimaryColor,
                              value: _isAcceptedTerms,
                              onChanged: (value) {
                                setState(() {
                                  _isAcceptedTerms = value!;
                                  registercontroller
                                          .checkTermsAndPrivacy.value =
                                      !registercontroller
                                          .checkTermsAndPrivacy.value;
                                });
                              }),
                        ),
                        const SizedBox(width: 5),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "accept".tr,
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                " " + "termsandconditions".tr,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // end of terms and conditions

                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomButton(
                        isDisable:
                            registercontroller.checkTermsAndPrivacy.value ==
                                    false
                                ? true
                                : false,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await registercontroller.register(
                                userBody: UserBody(
                                    firstName: _userNameController.text,
                                    lastName: _userNameController.text,
                                    password: _passwordController.text,
                                    cellPhoneNum:
                                        registercontroller.signUpPhoneNumber,
                                    gender: _genderController.text,
                                    dateOfBirth: _birthDateController.text,
                                    email: _mailController.text,
                                    termsConditionsAcceptance:
                                        registercontroller
                                            .checkTermsAndPrivacy.value));
                          }
                        },
                        text: "SignUp".tr,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    //end of sign up btn
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("haveaccount".tr),
                        TextButton(
                          child: Text(
                            "login".tr,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            //   getData.gustID = null;
                            Get.offAllNamed(RouteHelper.getsignInPage());
                          },
                        ),
                      ],
                    ),
                    // end of log in btn
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteHelper.getHomePage());
                        },
                        child: Text(
                          "continueasaguest".tr,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // end of guest btn
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggleSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }
}
