// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_print, avoid_unnecessary_containers, avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/widget/home/cart_widget.dart';
import 'package:the_drive/view/widget/home/main_app_bar.dart';
import 'package:the_drive/view/base/categrois_list.dart';
import 'package:the_drive/view/widget/home_station/choose_pickups_list.dart';
import 'package:the_drive/view/widget/home_station/product_list.dart';

import '../../../widget/home_station/station_deatils.dart';

class PickupTypeScreen extends StatefulWidget {
  int pickupType;
  PickupTypeScreen({
    Key? key,
    required this.pickupType,
  }) : super(key: key);
  @override
  State<PickupTypeScreen> createState() => _PickupTypeScreenState();
}

class _PickupTypeScreenState extends State<PickupTypeScreen> {
  int pickupType = 0;
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ChoosePickupsList(
                          onTap: (v) {
                            setState(() {
                              pickupType = v;
                            });
                            print(v);
                          },
                          selectedIndex: pickupType),
                    ),
                    const CategoriesList(),
                    const SizedBox(
                      height: 20,
                    ),
                    pickupType == 1 || pickupType == 2 || pickupType == 3
                        ? Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ProductsList(
                                    onTap: (index) {
                                      // navigatTo(
                                      //     context,
                                      //     ProductDetailsScreen(
                                      //       pickType: pickupType,
                                      //     ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    "pickupHeader".tr,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: inProgressContantColor),
                                  ),
                                  Text(
                                    "instractorMsg".tr,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: inProgressContantColor),
                                  ),
                                  const SizedBox(
                                    height: 36,
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/choose_pick_up.svg"),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              MainAppBar(
                isNavigateFromCart: true,
                trillingWidget: InkWell(
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
                  child: Padding(
                    padding: localNotifair.value == "ar"
                        ? const EdgeInsets.only(right: 30.0)
                        : const EdgeInsets.only(right: 0.0),
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
