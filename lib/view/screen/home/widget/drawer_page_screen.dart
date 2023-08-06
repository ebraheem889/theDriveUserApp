// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, sort_child_properties_last, avoid_types_as_parameter_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/token_handler_controller.dart';
import 'package:the_drive/controller/user_controller.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/images.dart';
import 'package:the_drive/view/screen/screens_from_darwer/contact_us.dart';
import 'package:the_drive/view/screen/screens_from_darwer/fav_screen.dart';
import 'package:the_drive/view/screen/screens_from_darwer/myOrder.dart';
import 'package:the_drive/view/screen/screens_from_darwer/personal_info.dart';
import 'package:the_drive/view/screen/screens_from_darwer/setting.dart';
import 'package:the_drive/view/screen/screens_from_darwer/wallet.dart';
import 'package:the_drive/view/widget/custom/alerts/alertForGoogleMaps.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),

        GetBuilder<UserController>(builder: (userController) {
          return userController.isLoading || userController.userInfoData == null
              ? Shimmer.fromColors(
                  baseColor: greyColor.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.4),
                  enabled: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 43,
                                height: 43,
                                // margin: const EdgeInsets.only(
                                //   top: 24.0,
                                //   bottom: 64.0,
                                // ),
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  color: lightSecondaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: 100,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 43,
                              height: 43,
                              // margin: const EdgeInsets.only(
                              //   top: 24.0,
                              //   bottom: 64.0,
                              // ),
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                color: lightSecondaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              child: Image.asset(userController.avatarPath),
                              width: 40,
                              height: 40,
                              // margin: const EdgeInsets.only(
                              //   top: 25.0,
                              //   bottom: 64.0,
                              // ),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: Text(
                            "${userController.userInfoData!.firstname ?? "Guest User"}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

          // end of image and name
        }),
        ListTile(
          onTap: () {
            Get.toNamed(RouteHelper.getPersonalInfoScreen());
          },
          leading: SvgPicture.asset("assets/icons/personal.svg"),
          title: Text(
            "personalInfo".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),

        // end of personal info

        ListTile(
          onTap: () {
            Get.toNamed(RouteHelper.getMyOrderScreen());
          },
          leading: SvgPicture.asset("assets/icons/myorder.svg"),
          title: Text(
            "myOrders".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),

        // end of my orders

        ListTile(
          onTap: () {
            // go to favorit screen
            Get.toNamed(RouteHelper.getFavoritPage());
          },
          leading: SvgPicture.asset("assets/icons/fav.svg"),
          title: Text(
            "favourite".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),

        // end of favorits
        ListTile(
          onTap: () {
            Get.toNamed(RouteHelper.getWalletPage());
          },
          leading: SvgPicture.asset("assets/icons/wallet.svg"),
          title: Text(
            "wallet".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),

        // end of wallet
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (Builder) {
                  return checkLunchGoogleMaps(context);
                });
          },
          leading: SvgPicture.asset("assets/icons/location.svg"),
          title: Text(
            "location".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        // end of location

        ListTile(
          onTap: () {
            Get.toNamed(RouteHelper.getSettingPage());
          },
          leading: const Icon(Icons.settings),
          title: Text(
            "setting".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        //end of setting
        ListTile(
          onTap: () {
            Get.toNamed(RouteHelper.getContactUsPage());
          },
          leading: SvgPicture.asset("assets/icons/conactus.svg"),
          title: Text(
            "contactUs".tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        10.ph,

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
          child: Container(
            width: 155,
            height: 3.0,
            color: Theme.of(context).primaryColor,
          ),
        ),
        10.ph,
        Text(
          "termsConditions".tr,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        140.ph,
        const Spacer(),
      ],
    );
  }
}
