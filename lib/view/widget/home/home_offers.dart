// ignore_for_file: unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/screen/stationsOffers/offers_screen.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/home_offers_card.dart';

class HomeOffers extends StatefulWidget {
  const HomeOffers({Key? key}) : super(key: key);

  @override
  State<HomeOffers> createState() => _HomeOffersState();
}

class _HomeOffersState extends State<HomeOffers> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriveStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, DriveStates state) {
        DriverCubit getData = DriverCubit.get(context);
        return Column(
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
                    navigatTo(context, const OffersScreen());
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              children: [
                GestureDetector(
                  onTap: (() {
                    // context.router.push(ProductDetailsRoute(pickType: 5));
                  }),
                  child: const HomeOfferCard(
                    color: Color(0xFFC38C76),
                    isOffer: true,
                    title: "Ice Cream",
                    image: "assets/images/ice-cream.png",
                    logo: "assets/images/Dolato.png",
                    offer: "20",
                    price: "79.99",
                    productName: "Vanilla",
                  ),
                ),
                const HomeOfferCard(
                  height: 180,
                  isOffer: true,
                  color: Color(0xFF262626),
                  title: "Burger",
                  image: "assets/images/burger-2.png",
                  logo: "assets/images/brgr.png",
                  offer: "15",
                  price: "84.99",
                  productName: "Big Mac",
                ),
                const HomeOfferCard(
                  color: Color(0xFF00653D),
                  title: "Ice Coffee",
                  isOffer: true,
                  image: "assets/images/drink.png",
                  logo: "assets/images/Starbucks.png",
                  offer: "20",
                  price: "79.99",
                  productName: "Vanilla",
                ),
                const HomeOfferCard(
                  height: 180,
                  color: Color(0xFF0E1D49),
                  title: "Bakery",
                  isOffer: true,
                  image: "assets/images/cinabon-package.png",
                  logo: "assets/images/Cinnabon.png",
                  offer: "20",
                  price: "79.99",
                  productName: "Vanilla",
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
