// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
import 'package:the_drive/view/base/base_loader.dart';
import 'package:the_drive/view/base/cart.dart';
import 'package:the_drive/view/base/custom_drop_down.dart';
import 'package:the_drive/view/base/drop_down_filter.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/cart_widget.dart';
import 'package:the_drive/view/widget/home/home_offers_card.dart';
import 'package:the_drive/view/widget/home/main_app_bar.dart';

//that will update

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final valKey = GlobalKey<ScaffoldState>();
  late final POSDrawerController controller;

  int _categorySelectedIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
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
            GetBuilder<OfferController>(builder: ((offerController) {
              return offerController.isLoading ||
                      offerController.offersList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        161.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomTitle(
                            title: "offersHeader".tr,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        24.ph,
                        AppLoader(
                          loaderView: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 34.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyColorBorder, width: 1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  items: [],
                                  onChanged: (onChanged) {},
                                  hint: Text(
                                    "stationTitle".tr,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: greyColorText),
                                  ),
                                  icon: SvgPicture.asset(
                                      "assets/icons/dropDownIcon.svg"),
                                )),
                                const SizedBox(
                                  width: 33,
                                ),
                                Expanded(
                                    child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: greyColorBorder, width: 1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  items: [],
                                  onChanged: (onChanged) {},
                                  hint: Text(
                                    "catrgoryListHint".tr,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: greyColorText),
                                  ),
                                  icon: SvgPicture.asset(
                                      "assets/icons/dropDownIcon.svg"),
                                )),
                              ],
                            ),
                          ),
                        ),
                        40.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Shimmer.fromColors(
                              baseColor: greyColor.withOpacity(0.5),
                              highlightColor: Colors.grey.withOpacity(0.4),
                              enabled: true,
                              child: StaggeredGrid.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10,
                                children: List.generate(4, (index) {
                                  return HomeOfferCard(
                                    height: index % 3 == 0 ? 180 : 250,
                                    color: Color(0xFF0E2D49),
                                    title: "s",
                                    isOffer: true,
                                    image: "assets/images/cinabon-package.png",
                                    logo: "assets/images/Cinnabon.png",
                                    offer: "",
                                    price: "",
                                    productName: "",
                                  );
                                }),
                              )),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        161.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomTitle(
                            title: "offersHeader".tr,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        24.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // CustomDropDownFilter(
                              //     iconPath: "assets/icons/dropDownIcon.svg",
                              //     dropDownList:
                              //         Get.find<StationController>().stationList,
                              //     hintTxt: "stationTitle",
                              //     func: (selection) {
                              //       offerController.getCategories(
                              //           stationId: selection!.stationId);
                              //       offerController.Filtration(
                              //           stationName: selection.stationName!.en);
                              //     }),
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
                                      child: Text(
                                          value.stationName!.en.toString()),
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
                        ),
                        Expanded(
                          child: ListView(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10,
                                  children: List.generate(
                                      offerController.filterdMenus.length,
                                      (index) {
                                    return HomeOfferCard(
                                      height: index % 3 == 0 ? 180 : 250,
                                      isOffer: true,
                                      color: Color(0xFF0E2D49),
                                      title: offerController
                                          .filterdMenus[index].offerName
                                          .toString(),
                                      image: "assets/images/burger-2.png",
                                      logo: "assets/images/brgr.png",
                                      offer: offerController
                                          .filterdMenus[index].discount
                                          .toString(),
                                      price: offerController
                                          .filterdMenus[index].price
                                          .toString(),
                                      productName: offerController
                                          .filterdMenus[index].itemName
                                          .toString(),
                                    );
                                  })),
                            ),
                          ]),
                        )
                      ],
                    );
            })),
            MainAppBar(
              centerWidget: Text("stationTitle".tr,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              trillingWidget: Padding(
                padding: Get.find<LocalizationController>().isLtr
                    ? const EdgeInsets.only(right: 0.0)
                    : const EdgeInsets.only(right: 30.0),
                child: GestureDetector(
                  onTap: () {
                    controller.openDrawer(cartView());
                  },
                  child: SvgPicture.asset(
                    "assets/icons/cart.svg",
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

// DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: greyColorBorder, width: 1),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 ),
//                                 items: Get.find<StationController>()
//                                     .stationList
//                                     .map<DropdownMenuItem<StationModel>>(
//                                         (value) {
//                                   return DropdownMenuItem<StationModel>(
//                                     value: value,
//                                     child:
//                                         Text(value.stationName!.en.toString()),
//                                   );
//                                 }).toList(),
//                                 onChanged: (selection) {
//                                   offerController.getCategories(
//                                       stationId: selection!.stationId);
//                                   offerController.Filtration(
//                                       stationName: selection.stationName!.en);
//                                 },
//                                 hint: Text(
//                                   "stationTitle".tr,
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                       color: greyColorText),
//                                 ),
//                                 icon: SvgPicture.asset(
//                                     "assets/icons/dropDownIcon.svg"),
//                               )

//  Expanded(
//                             child: DropdownButtonFormField(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: greyColorBorder, width: 1),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           items: Get.find<OfferController>()
//                               .categories
//                               .map<DropdownMenuItem<String>>(
//                                   (String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                           onChanged: (onChanged) {
//                             offerController.offerCategoryFiltration(
//                                 categoryName: onChanged.toString());
//                           },
//                           hint: Text(
//                             "catrgoryListHint".tr,
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 color: greyColorText),
//                           ),
//                           icon: SvgPicture.asset(
//                               "assets/icons/dropDownIcon.svg"),
//                         )),
