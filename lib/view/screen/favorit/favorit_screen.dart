// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/favorit_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/dissimisable_helper.dart';
import 'package:the_drive/data/model/body/cart_item.dart';
import 'package:the_drive/util/images.dart';
import 'package:the_drive/view/screen/cart/widget/cart_Item_view.dart';
import 'package:the_drive/view/base/AddItemToCart.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

import 'widget/favorit_cart_view.dart';

class FavScreen extends StatefulWidget {
  FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  late List<CartItem> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFavoritList();
  }

  void _loadFavoritList() async {
    await Get.find<FavoritController>().setFavoritList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          barApp(context, "favoritesTitle".tr),
          const SizedBox(
            height: 40,
          ),
          //card of products

          GetBuilder<FavoritController>(builder: ((favoritController) {
            return favoritController.favoritList.isEmpty
                ? Center(
                    child: Container(
                    height: 400,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Lottie.asset(
                            'assets/icons/noproduct.json',
                          ),
                          const Text(
                            "No Favorits Added !",
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ))
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: favoritController.favoritList.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: DismissibleHelper(
                                onDismissed: ((direction) {
                                  if (direction.name.toLowerCase() ==
                                      "starttoend") {
                                    favoritController.addToCart(
                                        favoritController
                                            .getFavoritList()[index]);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddItemToCart(context, 1);
                                        });
                                  } else {
                                    favoritController.removeIfDissmissable(
                                        favoritController
                                            .getFavoritList()[index]);
                                  }
                                }),
                                key: UniqueKey(),
                                // confirmDismiss: (DismissDirection direction) {
                                //   return showDialog(
                                //       context: context,
                                //       builder: (builder) {
                                //         return Container(
                                //           height: 150,
                                //           width: 250,
                                //           child: AlertDialog(
                                //             title: direction ==
                                //                     DismissDirection.startToEnd
                                //                 ? Center(
                                //                     child: Text(
                                //                     "askToMoveToCart".tr,
                                //                     style: TextStyle(
                                //                         fontSize: 20,
                                //                         fontWeight:
                                //                             FontWeight.w600,
                                //                         color:
                                //                             inProgressContantColor),
                                //                   ))
                                //                 : Center(
                                //                     child: Text(
                                //                     "deleteAsk".tr,
                                //                     style: TextStyle(
                                //                         fontSize: 20,
                                //                         fontWeight:
                                //                             FontWeight.w600,
                                //                         color:
                                //                             inProgressContantColor),
                                //                   )),
                                //             actions: [
                                //               Padding(
                                //                 padding:
                                //                     const EdgeInsets.symmetric(
                                //                         horizontal: 20.0),
                                //                 child: Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.center,
                                //                   children: [
                                //                     CustomButton(
                                //                       fontSize: 13,
                                //                       text: direction ==
                                //                               DismissDirection
                                //                                   .startToEnd
                                //                           ? "cartButton".tr
                                //                           : "deleteButton".tr,
                                //                       height: 39,
                                //                       width: 90,
                                //                       onPressed: () {
                                //                         Navigator.pop(context);
                                //                         direction ==
                                //                                 DismissDirection
                                //                                     .startToEnd
                                //                             ? showDialog(
                                //                                 builder:
                                //                                     (context) {
                                //                                   return AddItemToCart(
                                //                                     context,
                                //                                     3,
                                //                                   );
                                //                                 },
                                //                                 context:
                                //                                     context)
                                //                             : Navigator.pop(
                                //                                 context);
                                //                       },
                                //                     ),
                                //                     SizedBox(
                                //                       width: 24,
                                //                     ),
                                //                     CustomButton(
                                //                       fontSize: 13,
                                //                       buttonColor:
                                //                           DeliveredContantColor,
                                //                       text: "cancelButton".tr,
                                //                       height: 39,
                                //                       width: 90,
                                //                       onPressed: () {
                                //                         Navigator.pop(context);
                                //                       },
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ],
                                //             shape: RoundedRectangleBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(24)),
                                //           ),
                                //         );
                                //       });
                                // },
                                direction: DismissDirection.horizontal,
                                background: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 131,
                                  width: 111,
                                  decoration: BoxDecoration(
                                      color: lightPrimaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Container(
                                          height: 27,
                                          width: 21,
                                          child: SvgPicture.asset(
                                              "assets/icons/cart.svg")),
                                    ],
                                  ),
                                ),
                                secondaryBackground: Container(
                                  clipBehavior: Clip.hardEdge,
                                  height: 131,
                                  width: 111,
                                  decoration: BoxDecoration(
                                      color: dismissambleDelete,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          height: 27,
                                          width: 21,
                                          child: const Icon(Icons.delete,
                                              color: Colors.white)),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ),
                                child: FavoritItemView(
                                  pickType: 1,
                                  ItemData:
                                      favoritController.getFavoritList()[index],
                                )),
                          );
                        })),
                  );
            //card of products
          }))
        ],
      ),
    );
  }
}
