// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_print, avoid_unnecessary_containers, avoid_types_as_parameter_names, non_constant_identifier_names
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/data/model/response/category_model.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/base/base_drawer.dart';
import 'package:the_drive/view/base/cart.dart';
import 'package:the_drive/view/base/categroy_card.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/screen/pickType/widget/item_card.dart';
import 'package:the_drive/view/screen/pickType/widget/pick_up_card.dart';
import 'package:the_drive/view/screen/pickType/widget/pick_up_screen_loader.dart';
import 'package:the_drive/view/screen/pickType/widget/select_pick_up_view.dart';
import 'package:the_drive/view/screen/productdetails/product_details.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/cart_widget.dart';
import 'package:the_drive/view/widget/home/main_app_bar.dart';
import 'package:the_drive/view/base/categrois_list.dart';
import 'package:the_drive/view/widget/home_station/choose_pickups_list.dart';
import 'package:the_drive/view/widget/home_station/product_list.dart';

import 'widget/category_items_loader.dart';

class PickupTypeScreen extends StatefulWidget {
  String stationID;
  PickupTypeScreen({
    Key? key,
    required this.stationID,
  }) : super(key: key);
  @override
  State<PickupTypeScreen> createState() => _PickupTypeScreenState();
}

class _PickupTypeScreenState extends State<PickupTypeScreen> {
  int pickupType = 0;

  List<String> _pickUpIcons = [];
  List<Map<String, String>> _categoriesIcons = [];

  final valKey = GlobalKey<ScaffoldState>();
  late final POSDrawerController controller;
  @override
  void initState() {
    super.initState();
    _loadAndInitializeData();
  }

  void _loadAndInitializeData() async {
    controller = POSDrawerController(valKey);
    await Get.find<StationController>().getPickTypes();
    Get.find<StationController>().pickUpselectedIndex = -1;
    Get.find<StationController>().categorySelectedIndex = 0;
    Get.find<StationController>().categories.clear();
    _pickUpIcons = [
      "assets/icons/spon.svg",
      "assets/icons/car.svg",
      "assets/icons/box-hand.svg"
    ];
    _categoriesIcons = [
      {"allNotification": "assets/icons/union.svg"},
      {"fastfoodTitle": "assets/icons/fast_food.svg"},
      {"drinksTitle": "assets/icons/drinks.svg"},
      {"slideItemTitle": "assets/icons/side_item.svg"},
      {"allNotification": "assets/icons/union.svg"},
      {"fastfoodTitle": "assets/icons/fast_food.svg"},
      {"drinksTitle": "assets/icons/drinks.svg"},
      {"slideItemTitle": "assets/icons/side_item.svg"},
      {"allNotification": "assets/icons/union.svg"},
      {"fastfoodTitle": "assets/icons/fast_food.svg"},
      {"drinksTitle": "assets/icons/drinks.svg"},
      {"slideItemTitle": "assets/icons/side_item.svg"},
      {"allNotification": "assets/icons/union.svg"},
      {"fastfoodTitle": "assets/icons/fast_food.svg"},
      {"drinksTitle": "assets/icons/drinks.svg"},
      {"slideItemTitle": "assets/icons/side_item.svg"},
      {"allNotification": "assets/icons/union.svg"},
      {"fastfoodTitle": "assets/icons/fast_food.svg"},
      {"drinksTitle": "assets/icons/drinks.svg"},
      {"slideItemTitle": "assets/icons/side_item.svg"},
      {"allNotification": "assets/icons/union.svg"},
      {"fastfoodTitle": "assets/icons/fast_food.svg"},
      {"drinksTitle": "assets/icons/drinks.svg"},
      {"slideItemTitle": "assets/icons/side_item.svg"}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StationController>(builder: ((stationController) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          key: valKey,
          endDrawer: ValueListenableBuilder<Widget>(
            valueListenable: controller,
            builder: (context, value, child) {
              return value;
            },
          ),
          body: stationController.isLoading
              ? PickUpScreenLoader()
              : Stack(
                  children: [
                    Positioned(
                        top: (context.width * 0.4282677847060769),
                        left: 0,
                        right: 0,
                        child: Container(
                          width: context.width,
                          height: context.height,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: CustomTitle(
                                    title: "pickupHeader".tr,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // end of pick up headers
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40),
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            stationController.pickUpList.length,
                                        itemBuilder: ((context, index) {
                                          return Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: PickupCard(
                                                svgIconPath:
                                                    _pickUpIcons[index],
                                                title: stationController
                                                    .pickUpList[index]
                                                    .displayValue
                                                    .toString(),
                                                isSelected: stationController
                                                        .pickUpselectedIndex ==
                                                    index,
                                                tap: () {
                                                  stationController
                                                      .getMenuByIdAndPickUp(
                                                          stationId:
                                                              widget.stationID,
                                                          pickUp:
                                                              stationController
                                                                  .pickUpList[
                                                                      index]
                                                                  .displayValue,
                                                          index: index);
                                                }),
                                          );
                                        })),
                                  ),
                                ), // end of pick up cards
                                stationController.isMenuLoading
                                    ? CategoryItemsLoader()
                                    : Container(
                                        width: context.width,
                                        height: context.height,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 65,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemCount: stationController
                                                              .filterdMenus
                                                              .length ==
                                                          0
                                                      ? 0
                                                      : stationController
                                                          .categories.length,
                                                  primary: true,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: CategoryCard(
                                                        onPressed: () {
                                                          stationController
                                                              .initIndexAndFilter(
                                                                  index,
                                                                  stationController
                                                                      .categories[
                                                                          index]
                                                                      .categoryName
                                                                      .toString());
                                                        },
                                                        text: stationController
                                                            .categories[index]
                                                            .categoryName
                                                            .toString(),
                                                        iconPath:
                                                            _categoriesIcons[
                                                                    index]
                                                                .values
                                                                .first,
                                                        isActive: stationController
                                                                .categorySelectedIndex ==
                                                            index,
                                                      ),
                                                    );
                                                  }),
                                            ), // end of categories
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            stationController
                                                        .pickUpselectedIndex ==
                                                    -1
                                                ? SelectPickUpView()
                                                : stationController
                                                        .filterdMenus.isEmpty
                                                    ? Container(
                                                        height: 400,
                                                        child: Center(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Lottie.asset(
                                                                'assets/icons/noproduct.json',
                                                              ),
                                                              const Text(
                                                                "No Product Founded !",
                                                                style: TextStyle(
                                                                    color:
                                                                        textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: double.infinity,
                                                        height:
                                                            context.height / 2,
                                                        child: ListView.builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            itemCount:
                                                                stationController
                                                                    .filterdMenus
                                                                    .length,
                                                            primary: true,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  Get.to(() =>
                                                                      ProductDetails(
                                                                        pickType:
                                                                            5,
                                                                        menuModel:
                                                                            stationController.filterdMenus[index],
                                                                      ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                    child:
                                                                        ItemCard(
                                                                      menuModel:
                                                                          stationController
                                                                              .filterdMenus[index],
                                                                      isLast: stationController.filterdMenus.length -
                                                                              1 ==
                                                                          index,
                                                                    ),
                                                                    // end of item card
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      ), // end of products view
                                          ],
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )),
                    MainAppBar(
                      isNavigateFromCart: true,
                      trillingWidget: InkWell(
                        onTap: () {
                          controller.openDrawer(cartView());
                        },
                        child: Padding(
                          padding: Get.find<LocalizationController>().isLtr
                              ? const EdgeInsets.only(right: 0.0)
                              : const EdgeInsets.only(right: 30.0),
                          child: SvgPicture.asset(
                            "assets/icons/cart.svg",
                          ),
                        ),
                      ),
                      canNavigate: true,
                      spaceFromCenterTop: 15,
                      centerWidget: Image.asset(
                        "assets/images/brgr.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ), // end of main app bar
                  ],
                ));
    }));
  }
}
