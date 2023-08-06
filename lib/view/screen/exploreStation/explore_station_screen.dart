// ignore_for_file: use_key_in_widget_constructors, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/base/base_drawer.dart';
import 'package:the_drive/view/base/cart.dart';
import 'package:the_drive/view/screen/screen_from_home/stations/please_chosse_pick_type.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/screen/home/widget/home_station_card.dart';
import 'package:the_drive/view/widget/home/cart_widget.dart';
import 'package:the_drive/view/widget/home/main_app_bar.dart';
import 'package:the_drive/view/widget/home/station.dart';

class StationsScreen extends StatefulWidget {
  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  bool isCartClick = false;
  int counter1 = 5;
  int counter = 1;
  final valKey = GlobalKey<ScaffoldState>();
  late final POSDrawerController controller;
  @override
  void initState() {
    super.initState();
    _loadData();
    controller = POSDrawerController(valKey);
  }

  void _loadData() async {
    if (Get.find<StationController>().stationList.isEmpty) {
      await Get.find<StationController>().getAllStations();
    } else {
      // await Get.find<StationController>().getAllStations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StationController>(builder: ((statioController) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        key: valKey,
        endDrawer: ValueListenableBuilder<Widget>(
          valueListenable: controller,
          builder: (context, value, child) {
            return value;
          },
        ),
        body: Stack(
          children: [
            Positioned(
              top: (context.width * 0.4282677847060769),
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomTitle(
                      title: "stationHeader".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runAlignment: WrapAlignment.spaceBetween,
                      alignment: WrapAlignment.start,
                      runSpacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (int i = 0;
                            i < statioController.stationList.length;
                            i++)
                          HomeStationCard(
                            tap: () {
                              Get.toNamed(RouteHelper.getPickTypeScreen(
                                  statioController.stationList[i].stationId
                                      .toString()));
                            },
                            title: Get.find<LocalizationController>().isLtr
                                ? statioController
                                    .stationList[i].stationName!.en
                                    .toString()
                                : statioController
                                    .stationList[i].stationName!.ar
                                    .toString(),
                            imagePath: stations[i].imagePath,
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
      );
    }));
  }
}
