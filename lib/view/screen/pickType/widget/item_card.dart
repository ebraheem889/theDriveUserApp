// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/favorit_controller.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_circle_button.dart';
import 'package:the_drive/view/widget/custom/custom_pragraph.dart';
import 'package:the_drive/view/widget/home_station/product_card.dart';

import '../../../../controller/services/const/colors.dart';

class ItemCard extends StatefulWidget {
  ItemModel menuModel;
  bool isLast;

  ItemCard({super.key, required this.menuModel, required this.isLast});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late CartController _cartController;
  late FavoritController _favoritController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeDataMembers();
  }

  void _initializeDataMembers() {
    _cartController = Get.find<CartController>();
    _favoritController = Get.find<FavoritController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                offset: const Offset(6, 8),
                blurRadius: 20,
                color: Colors.black.withOpacity(0.08),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -35,
                top: 0,
                bottom: 0,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      "assets/images/product-ill.svg",
                      height: 230,
                      fit: BoxFit.cover,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/images/burger.png",
                      height: 120,
                      width: 125,
                      fit: BoxFit.contain,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
                // end of item pic
              ),
              Positioned(
                left: localNotifair.value == "ar" ? 16 : 20,
                top: localNotifair.value == "ar" ? 10 : 20,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 250,
                  child: Column(
                    children: [
                      Text(
                        widget.menuModel.itemName.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      // end of item name
                      const SizedBox(
                        height: 8,
                      ),
                      customProductText(
                          context: context,
                          paragraph:
                              widget.menuModel.productDescription.toString(),
                          paragraphColor: greyColor,
                          maxLines: 2,
                          textAlign: TextAlign.left),
                      // end of item description
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: buttonColor,
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: textButtonColors,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "${widget.menuModel.itemPrice} ${"egyptCurrency".tr}",
                              style: arabicmaincairoRegular.copyWith(
                                  fontSize: 13, color: Colors.white),
                            ),
                            // end of item price
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          CustomCircularButton(
                            onPressed: () {
                              if (_favoritController
                                  .isExistInFavorit(widget.menuModel)) {
                                showCustomSnackBar(
                                    "Already In Your Favorits !");
                              } else {
                                _favoritController.addToFavorit(
                                    widget.menuModel, 1);
                                showCustomSnackBar(
                                    "Successfuly Added To Favorits. ",
                                    isError: false);
                              }
                            },
                            svgIconPath: "assets/icons/heart.svg",
                          ),
                          // end of add to favorit btn
                          const SizedBox(
                            width: 7,
                          ),
                          // CustomCircularButton(
                          //   onPressed: () {
                          //     if (!_cartController
                          //         .isExistInCart(widget.menuModel)) {
                          //       _cartController.addItemToCart(
                          //           widget.menuModel, 1);
                          //       showCustomSnackBar(
                          //           "Successfuly Added To Cart. ",
                          //           isError: false);
                          //     } else {
                          //       showCustomSnackBar("Already In Your Cart !");
                          //     }
                          //   },
                          //   svgIconPath: "assets/icons/cart-plus.svg",
                          // ), // end of add to cart
                        ],
                      ),
                      // end of item actions
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              // end of item data
            ],
          ),
        ),
      ),
    );
  }
}
