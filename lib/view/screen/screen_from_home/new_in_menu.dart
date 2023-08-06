// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/offer_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/data/model/response/station_model.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/view/base/base_drawer.dart';
import 'package:the_drive/view/base/cart.dart';
import 'package:the_drive/view/base/custom_drop_down.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/cart_widget.dart';
import 'package:the_drive/view/widget/home/home_offers_card.dart';
import 'package:the_drive/view/widget/home/main_app_bar.dart';

class NewInMenuScreen extends StatefulWidget {
  NewInMenuScreen({Key? key}) : super(key: key);

  @override
  State<NewInMenuScreen> createState() => _NewInMenuScreenState();
}

class _NewInMenuScreenState extends State<NewInMenuScreen> {
  bool isCartClick = false;

  int counter1 = 5;

  int counter = 1;
  final valKey = GlobalKey<ScaffoldState>();
  late final POSDrawerController controller;
  int _categorySelectedIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = POSDrawerController(valKey);
    _initData();
  }

  void _initData() async {
    Get.find<OfferController>().initCategories();
    Get.find<OfferController>().initFilterdOffersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 161,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CustomTitle(
                        title: "newInMenuHeader".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GetBuilder<OfferController>(builder: ((offerController) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomDropDownMenu(
                                hintText: "stationTitle",
                                value: Get.find<StationController>()
                                    .stationList[_selectedIndex],
                                items: Get.find<StationController>()
                                    .stationList
                                    .map<DropdownMenuItem<StationModel>>(
                                        (value) {
                                  return DropdownMenuItem<StationModel>(
                                    value: value,
                                    child:
                                        Text(value.stationName!.en.toString()),
                                  );
                                }).toList(),
                                onChanged: (selection) {
                                  _changeSelectedIndex(selection!);

                                  offerController.getCategories(
                                      stationId: selection.stationId);
                                  offerController.stationFilter(
                                      stationName: selection.stationName!.en);
                                },
                              ),
                            ),
                            33.pw,
                            Expanded(
                              child: CustomDropDownMenu(
                                hintText: "catrgoryListHint".tr,
                                value: Get.find<OfferController>()
                                    .categories[_categorySelectedIndex],
                                items: Get.find<OfferController>()
                                    .categories
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (selectedCategory) {
                                  _changeCategorySelectedIndex(
                                      selectedCategory!);

                                  offerController.categoryFilter(
                                      categoryName: selectedCategory,
                                      StationId: Get.find<StationController>()
                                          .stationList[_selectedIndex]
                                          .stationId
                                          .toString());
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
                    // end of buttons
                    40.ph,
                    GestureDetector(
                      onTap: (() {
                        // context.router
                        //     .push(ProductDetailsRoute(pickType: 6));
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        height: 170,
                        child: const HomeOfferCard(
                          isOffer: false,
                          color: Color(0xFF262626),
                          title: "Hot Dog",
                          image: "assets/images/burger1.png",
                          logo: "assets/images/brgr.png",
                          offer: "15",
                          price: "79.99",
                          productName: "Double Dog",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 32),
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        children: const [
                          HomeOfferCard(
                            color: Color(0xFFC38C76),
                            isOffer: false,
                            title: "Ice Cream",
                            image: "assets/images/ice-cream.png",
                            logo: "assets/images/Dolato.png",
                            offer: "20",
                            price: "79.99",
                            productName: "Vanilla",
                          ),
                          HomeOfferCard(
                            height: 180,
                            isOffer: false,
                            color: Color(0xFF262626),
                            title: "Burger",
                            image: "assets/images/burger-2.png",
                            logo: "assets/images/brgr.png",
                            offer: "15",
                            price: "84.99",
                            productName: "Big Mac",
                          ),
                          HomeOfferCard(
                            color: Color(0xFF00653D),
                            title: "Ice Coffee",
                            isOffer: false,
                            image: "assets/images/drink.png",
                            logo: "assets/images/Starbucks.png",
                            offer: "20",
                            price: "79.99",
                            productName: "Vanilla",
                          ),
                          HomeOfferCard(
                            height: 180,
                            color: Color(0xFF0E1D49),
                            title: "Bakery",
                            isOffer: false,
                            image: "assets/images/cinabon-package.png",
                            logo: "assets/images/Cinnabon.png",
                            offer: "20",
                            price: "79.99",
                            productName: "Vanilla",
                          ),
                          HomeOfferCard(
                            color: Color(0xFFC38C76),
                            isOffer: false,
                            title: "Ice Cream",
                            image: "assets/images/ice-cream.png",
                            logo: "assets/images/Dolato.png",
                            offer: "20",
                            price: "79.99",
                            productName: "Vanilla",
                          ),
                          HomeOfferCard(
                            height: 180,
                            isOffer: false,
                            color: Color(0xFF262626),
                            title: "Burger",
                            image: "assets/images/burger-2.png",
                            logo: "assets/images/brgr.png",
                            offer: "15",
                            price: "84.99",
                            productName: "Big Mac",
                          ),
                          HomeOfferCard(
                            color: Color(0xFF00653D),
                            title: "Ice Coffee",
                            isOffer: false,
                            image: "assets/images/drink.png",
                            logo: "assets/images/Starbucks.png",
                            offer: "20",
                            price: "79.99",
                            productName: "Vanilla",
                          ),
                          HomeOfferCard(
                            height: 180,
                            color: Color(0xFF0E1D49),
                            title: "Bakery",
                            isOffer: false,
                            image: "assets/images/cinabon-package.png",
                            logo: "assets/images/Cinnabon.png",
                            offer: "20",
                            price: "79.99",
                            productName: "Vanilla",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      height: 170,
                      child: const HomeOfferCard(
                        color: Color(0xFFC38C76),
                        isOffer: false,
                        title: "Ice Cream",
                        image: "assets/images/ice-cream.png",
                        logo: "assets/images/Dolato.png",
                        offer: "20",
                        price: "79.99",
                        productName: "Vanilla",
                      ),
                    ),
                    32.ph,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      height: 170,
                      child: const HomeOfferCard(
                        color: Color(0xFFC38C76),
                        isOffer: false,
                        title: "Ice Cream",
                        image: "assets/images/ice-cream.png",
                        logo: "assets/images/Dolato.png",
                        offer: "20",
                        price: "79.99",
                        productName: "Vanilla",
                      ),
                    ),
                    30.ph
                  ],
                ),
              ],
            ),
            MainAppBar(
              centerWidget: Text(
                "newInMenu".tr,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              trillingWidget: InkWell(
                onTap: () {
                  setState(() {
                    // if (getData.gustID != null) {
                    //   showDialog(
                    //       context: context,
                    //       builder: (BuildContext) {
                    //         return GustAlert(context);
                    //       });
                    // } else {
                    //   isCartClick = !isCartClick;
                    // }
                  });

                  // navigatTo(
                  //     context,
                  //     CartScreen(
                  //       pickType: 3,
                  //     ));
                },
                child: GestureDetector(
                  onTap: () {
                    controller.openDrawer(cartView());
                  },
                  child: Padding(
                    padding: Get.find<LocalizationController>().isLtr
                        ? EdgeInsets.only(right: 0)
                        : EdgeInsets.only(right: 30.0),
                    child: SvgPicture.asset(
                      "assets/icons/cart.svg",
                    ),
                  ),
                ),
              ),
              canNavigate: true,
              spaceFromCenterTop: 15,
            ),
          ],
        ),
      ),
    );
  }

  void _changeSelectedIndex(StationModel stationModel) {
    setState(() {
      _categorySelectedIndex = 0;
      _selectedIndex =
          Get.find<StationController>().stationList.indexOf(stationModel);
    });
  }

  void _changeCategorySelectedIndex(String category) {
    setState(() {
      _categorySelectedIndex =
          Get.find<OfferController>().categories.indexOf(category);
    });
  }
}
