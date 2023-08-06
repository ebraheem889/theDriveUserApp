// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/screen/screen_from_home/stations/please_chosse_pick_type.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/screen/home/widget/home_station_card.dart';
import 'package:the_drive/view/widget/home/station.dart';

class HomeStations extends StatelessWidget {
  const HomeStations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    quarterTurns: localNotifair.value == "ar" ? 2 : 0,
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
                // navigatTo(context, StationsScreen());
              },
            ),
          ],
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
              for (int i = 0; i < stations.length; i++)
                HomeStationCard(
                  tap: () {
                    navigatTo(
                        context,
                        PickupTypeScreen(
                          pickupType: 0,
                        ));
                  },
                  title: stations[i].title,
                  imagePath: stations[i].imagePath,
                )
            ],
          ),
        ),
      ],
    );
  }
}
