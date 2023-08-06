// ignore_for_file: use_key_in_widget_constructors, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/const/function.dart';
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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<DriverCubit, DriveStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, DriveStates state) {
        DriverCubit getData = DriverCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: (width * 0.4282677847060769),
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
                ),
              ),
              MainAppBar(
                centerWidget: Text("stationTitle".tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                trillingWidget: Padding(
                  padding: localNotifair.value == "ar"
                      ? const EdgeInsets.only(right: 30.0)
                      : const EdgeInsets.only(right: 0.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (getData.gustID != null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return GustAlert(context);
                              });
                        } else {
                          isCartClick = !isCartClick;
                        }
                      });

                      // navigatTo(
                      //     context,
                      //     CartScreen(
                      //       pickType: 3,
                      //     ));
                    },
                    child: SvgPicture.asset(
                      "assets/icons/cart.svg",
                    ),
                  ),
                ),
                canNavigate: true,
                spaceFromCenterTop: 15,
              ),
              if (isCartClick)
                cartLayout(
                    context: context,
                    counter1: counter1,
                    counter: counter,
                    height: (height * .12),
                    width: (width * .40),
                    imgPositionTop: height / 20,
                    imgPositionLeft: width * .40,
                    imgPositionRight: width * .40),
            ],
          ),
        );
      },
    );
  }
}
