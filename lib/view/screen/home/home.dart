// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/banner_controller.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/home_controller.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/new_in_menu_controller.dart';
import 'package:the_drive/controller/offer_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/controller/user_controller.dart';
import 'package:the_drive/data/model/response/station_model.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/base/base_drawer.dart';
import 'package:the_drive/view/base/cart.dart';
import 'package:the_drive/view/screen/home/widget/bannerView.dart';
import 'package:the_drive/view/screen/home/widget/drawer_guest_screen.dart';
import 'package:the_drive/view/screen/home/widget/drawer_page_screen.dart';
import 'package:the_drive/view/screen/home/widget/explore_loader.dart';
import 'package:the_drive/view/screen/home/widget/explore_station.dart';
import 'package:the_drive/view/screen/home/widget/home_menu.dart';
import 'package:the_drive/view/screen/home/widget/main_app_Bar.dart';
import 'package:the_drive/view/screen/home/widget/stations_offers.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

export 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static bool _isAuth = false;
  static bool get isAuth => _isAuth;
  static Future<void> loadData(bool reload) async {
    if (Get.find<AuthController>().isLoggedIn()) {
      _isAuth = true;

      if (_isAuth && Get.find<UserController>().userInfoModel == null) {
        Get.find<UserController>().getUserData();
      }
      await Get.find<StationController>().getStations(reload);
      await Get.find<OfferController>().getOffers(reload);
      await Get.find<BannerController>().getBanners(true);
      await Get.find<NewInMenuController>().getNewInMenu(reload);
    }
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  bool isInProgress = true;
  int _currentPage = 0;
  CartController _cartController = Get.find<CartController>();
  late LocalizationController _localizationController;
  final valKey = GlobalKey<ScaffoldState>();
  late final POSDrawerController controller;
  @override
  void initState() {
    super.initState();
    HomeScreen.loadData(false);
    controller = POSDrawerController(valKey);
    _localizationController = Get.find<LocalizationController>();
    _cartController = Get.find<CartController>()..setCarListFromLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          Get.find<UserController>().getUserData();
          Get.find<StationController>().getStations(true);
          Get.find<OfferController>().getOffers(true);
          Get.find<BannerController>().getBanners(true);
          Get.find<NewInMenuController>().getNewInMenu(true);
        },
        child: AdvancedDrawer(
            openRatio: .50,
            openScale: .70,
            backdropColor: Theme.of(context).scaffoldBackgroundColor,
            controller: _advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            animateChildDecoration: true,
            rtlOpening: _localizationController.isLtr ? false : true,
            disabledGestures: true,
            childDecoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            drawer: SafeArea(
              child: ListTileTheme(
                textColor: Colors.black,
                iconColor: lightPrimaryColor,
                child:
                    HomeScreen.isAuth ? DrawerPage() : DrawerGustPage(context),
              ),
            ),
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                key: valKey,
                endDrawer: ValueListenableBuilder<Widget>(
                  valueListenable: controller,
                  builder: (context, value, child) {
                    return value;
                  },
                ),
                body: SizedBox(
                    height: context.height,
                    child: Stack(children: [
                      Positioned(
                        top: (context.width * 0.20),
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BannerView(),
                              // end of ads slider
                              20.ph,
                              ExploreStation(),
                              // end of explore station
                              _activeOrders(),
                              //end of active orders
                              StationsOffers(),
                              // end of offers
                              10.ph,
                              const HomeMenu(),
                            ],
                          ),
                        ),
                      ),
                      MainAppBar(
                        leadingWidget: InkWell(
                          onTap: _handleMenuButtonPressed,
                          child: ValueListenableBuilder<AdvancedDrawerValue>(
                            valueListenable: _advancedDrawerController,
                            builder: (_, value, __) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  child: SvgPicture.asset(
                                    value.visible
                                        ? "assets/icons/x.svg"
                                        : "assets/icons/menu_button.svg",
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        centerWidget: Image.asset(
                          "assets/icons/app_logo.png",
                          width: 80,
                          height: 80,
                        ),
                        trillingWidget: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                HomeScreen.isAuth
                                    ? Get.toNamed(
                                        RouteHelper.getNotificationPage())
                                    : showDialog(
                                        context: context,
                                        builder: (BuildContext) {
                                          return GustAlert(context);
                                        });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Badge(
                                  position: BadgePosition.topStart(
                                      start: -6, top: -10),
                                  badgeColor: lightSecondaryColor,
                                  badgeContent: const Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'badge',
                                        color: Colors.white),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/icons/bell.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                            // end of notification
                            10.pw,

                            GetBuilder<CartController>(
                                builder: ((cartController) {
                              return InkWell(
                                onTap: () {
                                  HomeScreen.isAuth
                                      ? controller.openDrawer(cartView())
                                      : showDialog(
                                          context: context,
                                          builder: (BuildContext) {
                                            return GustAlert(context);
                                          });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  child: Badge(
                                    position: BadgePosition.topStart(
                                        start: -6, top: -10),
                                    badgeColor: lightSecondaryColor,
                                    badgeContent: Text(
                                      _cartController
                                          .getAllCartItems()
                                          .length
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'badge',
                                          color: Colors.white),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/icons/cart-circle-plus.svg",
                                      color: Colors.white,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              );
                            }))
                            // end of cart
                          ],
                        ),
                      ),
                    ])))));
  }

  Widget _activeOrders() {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomTitle(
              title: "activeOrdersTitle".tr,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 202,
              width: 800,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  //set border radius more than 50% of height and width to make circle
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "12 Aug 22  01:36 PM",
                            style: TextStyle(
                                fontSize: 12, color: lightPrimaryColor),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/inprogrss_point.svg'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "inProgress".tr,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: inProgressColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Cheesy Burger, American coffee, Ice… ",
                        style: TextStyle(
                            fontSize: 16,
                            color: lightSecondaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        width: 312,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/Betty.png"),
                            const SizedBox(
                              width: 12,
                            ),
                            Image.asset("assets/images/Betty.png"),
                            const SizedBox(
                              width: 12,
                            ),
                            Image.asset("assets/images/Betty.png"),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                              "assets/icons/inporgress_clock_icon.svg"),
                          const SizedBox(
                            width: 9,
                          ),
                          CustomTitle(
                            title: "7 ${"min".tr}",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          CustomButton(
                            // onPressed: (() =>
                            //     navigatTo(context, ActiveOrderScreen())),
                            text: "viewOrder".tr,
                            width: 107,
                            height: 41,
                            fontSize: 12,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  } // end of order in progress

  //function to pressed on menu home
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
