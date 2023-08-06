// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'dart:developer';
import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/user_controller.dart';
import 'package:the_drive/data/model/body/user_body.dart';
import 'package:the_drive/data/model/response/response_model.dart';
import 'package:the_drive/helper/date_converter.dart';
import 'package:the_drive/helper/dialog.dart';
import 'package:the_drive/util/config.dart';
import 'package:the_drive/util/images.dart';
import 'package:the_drive/view/base/customPhoneNumber/custom_phone_field.dart';
import 'package:the_drive/view/base/custom_form_field.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/customTextFormField.dart';
import 'package:the_drive/view/base/custom_appBar.dart';
import 'package:intl/intl.dart' as intl;
import "package:flutter/src/painting/box_decoration.dart" as decor;

class PersonalInfoScreen extends StatefulWidget {
  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController checkBoxController = TextEditingController();
  final genderList = <String>['male', 'female'];
  String? dropdownValue;
  bool checkValue = false;

  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _cellPhoneNameFocus = FocusNode();
  final FocusNode _genderFocus = FocusNode();
  final FocusNode _birthDateFocus = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _cellPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _isLoggedIn;
  late String avatarPath;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    if (!Get.find<UserController>().isProfileDataLoadedBefore) {
      await Get.find<UserController>().getUserData();
      _userNameController.text =
          Get.find<UserController>().userInfoData!.firstname ?? '';
      _emailController.text =
          Get.find<UserController>().userInfoData!.email ?? '';
      _cellPhoneController.text =
          Get.find<UserController>().userInfoData!.cellphonenum ?? '';
      _birthDateController.text = DateConverter.convertDate(
          BOD: Get.find<UserController>().userInfoData!.DateOfBirth.toString());
      _genderController.text =
          Get.find<UserController>().userInfoData!.Gender!.toLowerCase() == "f"
              ? "female".tr
              : "male".tr;
    } else {
      _userNameController.text =
          Get.find<UserController>().userInfoData!.firstname ?? '';
      _emailController.text =
          Get.find<UserController>().userInfoData!.email ?? '';
      _cellPhoneController.text =
          Get.find<UserController>().userInfoData!.cellphonenum ?? '';
      _birthDateController.text = DateConverter.convertDate(
          BOD: Get.find<UserController>().userInfoData!.DateOfBirth.toString());
      _genderController.text =
          Get.find<UserController>().userInfoData!.Gender!.toLowerCase() == "f"
              ? "female".tr
              : "male".tr;
    }
  } // end of load user data

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<UserController>(
      builder: ((controller) {
        return controller.isLoading
            ? _loadingWidget(controller)
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      barApp(context, _userNameController.text),
                      const SizedBox(
                        height: 24,
                      ),

                      SizedBox(
                          height: 19,
                          width: 90,
                          child: Text(
                            "userNameTitle".tr,
                            style:
                                const TextStyle(fontSize: 13, color: greyColor),
                          )),
                      const SizedBox(
                        height: 10,
                      ),

                      CustomFormField(
                        controller: _userNameController,
                        readOnly: true,
                      ),
                      // end of user name

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 19,
                          width: 90,
                          child: Text(
                            "phoneNumberTitle".tr,
                            style:
                                const TextStyle(fontSize: 13, color: greyColor),
                          )),
                      const SizedBox(
                        height: 10,
                      ),

                      CustomFormField(
                        controller: _cellPhoneController,
                        readOnly: true,
                      ),
                      // end of phone number

                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                          height: 19,
                          width: 90,
                          child: Text(
                            "email".tr,
                            style:
                                const TextStyle(fontSize: 13, color: greyColor),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        controller: _emailController,
                        readOnly: true,
                      ),
                      // end of user email

                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      Row(
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
                                    height: 23,
                                    child: Text(
                                      "genderTitle".tr,
                                      style: const TextStyle(
                                          fontSize: 13, color: greyColor),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 55,
                                  child: CustomFormField(
                                    controller: _genderController,
                                    readOnly: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          // end of gender
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 1,
                                ),
                                SizedBox(
                                    height: 23,
                                    child: Text(
                                      "birthdayTitle".tr,
                                      style: const TextStyle(
                                          fontSize: 13, color: greyColor),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomFormField(
                                  controller: _birthDateController,
                                  readOnly: true,
                                ),
                              ],
                            ),
                          ),
                          // end of date
                        ],
                      ),

                      // end of gender and birth date
                      const SizedBox(
                        height: 32,
                      ),
                      //select your avtar
                      SizedBox(
                          height: 23,
                          child: Text(
                            "setAvatarTitle".tr,
                            style: TextStyle(fontSize: 13, color: greyColor),
                          )),
                      const SizedBox(
                        height: 19,
                      ),
                      SizedBox(
                        height: 70,
                        width: 337,
                        child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              controller.avatars.length,
                              (index) => Padding(
                                padding: EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.changeSelectedAvatarIndex(index);
                                  },
                                  child: UnconstrainedBox(
                                    child: Container(
                                      width: 60,
                                      height: 58,
                                      decoration: index ==
                                              controller.selectedAvatarIndex
                                          ? decor.BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              border: Border.all(
                                                  color: Colors.greenAccent,
                                                  width: 2),
                                            )
                                          : null,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Image.asset(
                                            controller.avatars[index],
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      // end of select avatar
                      const SizedBox(
                        height: 18,
                      ),
                      //Save changes button
                      Center(
                        child: CustomButton(
                          height: 57,
                          width: MediaQuery.of(context).size.width,
                          onPressed: () async {
                            _updateProfile(
                                controller,
                                controller
                                    .avatars[controller.selectedAvatarIndex]);
                          },
                          text: "saveChangeTitle".tr,
                        ),
                      ),
                      const SizedBox(
                        height: 54,
                      ),
                    ],
                  ),
                ),
              );
      }),
    ));
  }

  void _updateProfile(UserController userController, String avatarPath) async {
    ResponseModel _responseModel =
        await userController.updateUserAvatar(avatarPath: avatarPath);
    if (_responseModel.isSuccess) {
      showCustomSnackBar('profile_updated_successfully'.tr, isError: false);
    }
  }

  Widget _loadingWidget(UserController controller) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          barApp(context, _userNameController.text),
          Expanded(
            child: Shimmer.fromColors(
                baseColor: greyColor.withOpacity(0.4),
                highlightColor: Colors.grey.withOpacity(0.5),
                enabled: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: decor.BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: decor.BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: decor.BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: decor.BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: decor.BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 50,
                                  width: context.width / 2.3,
                                  decoration: decor.BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Container(
                                  width: context.width / 4.3,
                                  height: 5,
                                  decoration: decor.BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 50,
                                  width: context.width / 2.3,
                                  decoration: decor.BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 23,
                          child: Text(
                            "setAvatarTitle".tr,
                            style: TextStyle(fontSize: 13, color: greyColor),
                          )),
                      const SizedBox(
                        height: 19,
                      ),
                      SizedBox(
                        height: 70,
                        width: 337,
                        child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: EdgeInsets.all(5),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: UnconstrainedBox(
                                    child: Container(
                                      width: 60,
                                      height: 58,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Image.asset(
                                            controller.avatars[index],
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
          )
        ]));
  }
}
