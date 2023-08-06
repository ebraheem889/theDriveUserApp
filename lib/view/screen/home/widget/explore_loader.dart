import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

import 'home_station_card.dart';

class ExploreLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height / 4,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
          child: Column(
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
                          Get.find<LocalizationController>().isLtr ? 0 : 2,
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
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 16,
            runAlignment: WrapAlignment.spaceBetween,
            alignment: WrapAlignment.start,
            runSpacing: 0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Shimmer.fromColors(
                  baseColor: greyColor.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.4),
                  enabled: true,
                  child: Container(
                    height: 100,
                    width: 78,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 78,
                          width: 78,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFFF9F9F9),
                            gradient: const LinearGradient(colors: [
                              Color(0xFFffffff),
                              Color(0xFFe0e0e0),
                            ]),
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 6,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ],
      )),
    );
  }
}
