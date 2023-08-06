import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/screen/home/widget/explore_loader.dart';
import 'package:the_drive/view/screen/home/widget/home_station_card.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/station.dart';

class ExploreStation extends StatefulWidget {
  @override
  State<ExploreStation> createState() => _ExploreStationState();
}

class _ExploreStationState extends State<ExploreStation> {
  late LocalizationController _localizationController;

  late List<Station> stations;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _localizationController = Get.find<LocalizationController>();
    stations = [
      Station(imagePath: "assets/images/Betty.png", title: "Betty"),
      Station(imagePath: "assets/images/Butter.png", title: "Butter"),
      Station(imagePath: "assets/images/Cinnabon.png", title: "Cinnabon"),
      Station(imagePath: "assets/images/Dolato.png", title: "Dolato"),
      Station(imagePath: "assets/images/Pick-up.png", title: "Pickup"),
      Station(
          imagePath: "assets/images/Seven-Fortunes.png",
          title: "Seven Fortunes"),
      Station(imagePath: "assets/images/Starbucks.png", title: "Starbucks"),
      Station(imagePath: "assets/images/brgr.png", title: "BRGR"),
      Station(imagePath: "assets/images/Betty.png", title: "Betty"),
      Station(imagePath: "assets/images/Butter.png", title: "Butter"),
      Station(imagePath: "assets/images/Cinnabon.png", title: "Cinnabon"),
      Station(imagePath: "assets/images/Dolato.png", title: "Dolato"),
      Station(imagePath: "assets/images/Pick-up.png", title: "Pickup"),
      Station(
          imagePath: "assets/images/Seven-Fortunes.png",
          title: "Seven Fortunes"),
      Station(imagePath: "assets/images/Starbucks.png", title: "Starbucks"),
      Station(imagePath: "assets/images/brgr.png", title: "BRGR"),
      Station(imagePath: "assets/images/Betty.png", title: "Betty"),
      Station(imagePath: "assets/images/Butter.png", title: "Butter"),
      Station(imagePath: "assets/images/Cinnabon.png", title: "Cinnabon"),
      Station(imagePath: "assets/images/Dolato.png", title: "Dolato"),
      Station(imagePath: "assets/images/Pick-up.png", title: "Pickup"),
      Station(
          imagePath: "assets/images/Seven-Fortunes.png",
          title: "Seven Fortunes"),
      Station(imagePath: "assets/images/Starbucks.png", title: "Starbucks"),
      Station(imagePath: "assets/images/brgr.png", title: "BRGR"),
    ];
    // this data is dummey data
    //TODO: remove dummy
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StationController>(builder: ((stationController) {
      return stationController.isLoading ||
              stationController.stationList.isEmpty
          ? Padding(padding: EdgeInsets.all(15), child: ExploreLoader())
          : Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTitle(
                        title: "stationHeader".tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      TextButton(
                        child: Row(
                          children: [
                            Text(
                              "viewAll".tr,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            RotatedBox(
                              quarterTurns:
                                  _localizationController.isLtr ? 0 : 2,
                              child: SvgPicture.asset(
                                "assets/icons/see_more.svg",
                                width: 8,
                                height: 12,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          // TODO: chang route
                          Get.toNamed(RouteHelper.getExploreStationScreen());
                        },
                      ),
                    ],
                  ),
                  20.ph,
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runAlignment: WrapAlignment.spaceBetween,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (int i = 0;
                            i < stationController.getstationCounterToView();
                            i++)
                          HomeStationCard(
                            tap: () {
                              Get.toNamed(RouteHelper.getPickTypeScreen(
                                  stationController.stationList[i].stationId
                                      .toString()));
                            },
                            title: _localizationController.isLtr
                                ? stationController
                                    .stationList[i].stationName!.en
                                    .toString()
                                : stationController
                                    .stationList[i].stationName!.ar
                                    .toString(),
                            imagePath: stations[i].imagePath,
                          )
                      ],
                    ),
                  ),
                ],
              ));
    }));
  }
}
