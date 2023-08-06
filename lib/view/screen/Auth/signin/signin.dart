// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/cubit/Auth/signin/cubit.dart';
import 'package:the_drive/controller/cubit/Auth/signin/states.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/base/customPhoneNumber/custom_phone_field.dart';
import 'package:the_drive/view/base/custom_form_field.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/customTextFormField.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController checkBoxController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isSecure = true;

  bool checkValue = false;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _phoneNumberController.text = "";
    _passwordController.text = "";
    checkValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: ((authcontroller) {
      return Scaffold(
        body: Center(
          child: Padding(
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
                    // main title
                    CustomTitle(
                      title: "Welcome Back",
                      fontSize: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "You have been missed 🥰",
                      style: TextStyle(color: greyColor, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 60,
                    ),

                    SizedBox(
                        height: 19,
                        child: const Text(
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
                    // end of phone number
                    const SizedBox(
                      height: 1,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(fontSize: 13, color: greyColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                      controller: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                      maxlines: 1,
                      hintLabel: "Password".tr,
                      isSecure: _isSecure,
                      suffixIcon: IconButton(
                        onPressed: () => _toggleSecure(),
                        icon: Icon(
                          _isSecure ? Icons.visibility_off : Icons.visibility,
                          color: greyColor,
                          size: 20,
                        ),
                      ),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required Field !";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Remember & forget password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => authcontroller.toggleRememberMe(),
                                child: Checkbox(
                                    activeColor: lightPrimaryColor,
                                    value: authcontroller.isActiveRememberMe,
                                    onChanged: (value) {
                                      authcontroller.toggleRememberMe();
                                    }),
                              ),
                              // const SizedBox(width: 5),
                              const Text(
                                "Remember me ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(RouteHelper.getforgetPasswordPage());
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    //signup button
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: () async {
                          // await authcontroller.login(
                          //     phone: _phoneNumberController.text,
                          //     password: authcontroller.passwordController.text);

                          _login(
                              authcontroller,
                              authcontroller.signInPhoneNumber,
                              _passwordController.text);
                        },
                        text: "Login",
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    // anther way tho login
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("have an Account ?"),
                        TextButton(
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(RouteHelper.getSignUp());
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteHelper.getHomePage());
                        },
                        child: const Text(
                          "Continue as a guest",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }

  void _login(AuthController authController, phone, password) async {
    authController.login(phone: phone, password: password).then((status) async {
      if (status.isSuccess) {
        if (authController.isActiveRememberMe) {
          authController.saveUserNumberAndPassword(phone, password);
        } else {
          authController.clearUserNumberAndPassword();
        }
        Get.offAllNamed(RouteHelper.getHomePage());
      } else {
        showCustomSnackBar(status.message);
      }
    });
  }

  void _toggleSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }
}
