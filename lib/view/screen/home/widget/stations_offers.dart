import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/offer_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/view/base/base_loader.dart';
import 'package:the_drive/view/screen/home/widget/home_offer_card.dart';
import 'package:the_drive/view/screen/stationsOffers/offers_screen.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';

class StationsOffers extends StatefulWidget {
  @override
  State<StationsOffers> createState() => _StationsOffesrState();
}

class _StationsOffesrState extends State<StationsOffers> {
  late LocalizationController _localizationController;
  @override
  void initState() {
    _localizationController = Get.find<LocalizationController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitle(
                  title: "offers".tr,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                const Spacer(),
                TextButton(
                  child: Row(
                    children: [
                      Text(
                        "seeMore".tr,
                        style: const TextStyle(fontSize: 14),
                      ),
                      8.pw,
                      RotatedBox(
                        quarterTurns: _localizationController.isLtr ? 0 : 2,
                        child: SvgPicture.asset(
                          "assets/icons/see_more.svg",
                          width: 8,
                          height: 12,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    Get.to(() => OffersScreen());
                    //navigatTo(context, const OffersScreen());
                  },
                ),
              ],
            ),
            20.ph,
            GetBuilder<OfferController>(builder: ((offerController) {
              return offerController.isLoading ||
                      offerController.offersList.isEmpty
                  ? AppLoader(
                      loaderView: StaggeredGrid.count(
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
                    ))
                  : StaggeredGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      children: List.generate(
                          offerController.offersList.length > 4
                              ? 4
                              : offerController.offersList.length, (index) {
                        return HomeOfferCard(
                          height: index % 3 == 0 ? 180 : 250,
                          color: Color(0xFF0E2D49),
                          title: offerController.offersList[index].offerName
                              .toString(),
                          isOffer: true,
                          image: "assets/images/cinabon-package.png",
                          logo: "assets/images/Cinnabon.png",
                          offer: offerController.offersList[index].discount
                              .toString(),
                          price: offerController.offersList[index].price
                              .toString(),
                          productName: offerController
                              .offersList[index].itemName
                              .toString(),
                        );
                      }),
                    );
            }))
          ],
        ));
  }
}
