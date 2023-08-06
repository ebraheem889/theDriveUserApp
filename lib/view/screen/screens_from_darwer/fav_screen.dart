// ignore_for_file: prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/dissimisable_helper.dart';
import 'package:the_drive/view/base/AddItemToCart.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DismissibleHelper(
              confirmDismiss: (DismissDirection direction) {
                return showDialog(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: 150,
                        width: 250,
                        child: AlertDialog(
                          title: direction == DismissDirection.startToEnd
                              ? Center(
                                  child: Text(
                                  "askToMoveToCart".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: inProgressContantColor),
                                ))
                              : Center(
                                  child: Text(
                                  "deleteAsk".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: inProgressContantColor),
                                )),
                          actions: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    fontSize: 13,
                                    text:
                                        direction == DismissDirection.startToEnd
                                            ? "cartButton".tr
                                            : "deleteButton".tr,
                                    height: 39,
                                    width: 90,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      direction == DismissDirection.startToEnd
                                          ? showDialog(
                                              builder: (context) {
                                                return AddItemToCart(
                                                  context,
                                                  3,
                                                );
                                              },
                                              context: context)
                                          : Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  CustomButton(
                                    fontSize: 13,
                                    buttonColor: DeliveredContantColor,
                                    text: "cancelButton".tr,
                                    height: 39,
                                    width: 90,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      );
                    });
              },
              direction: DismissDirection.horizontal,
              key: const ValueKey(1),
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
                        child: SvgPicture.asset("assets/icons/cart.svg")),
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
                        child: const Icon(Icons.delete, color: Colors.white)),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
              ),
              child: Container(
                height: 131,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 20, color: Colors.black38)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    //image and logo
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                            height: 93,
                            width: 106,
                            child: Image.asset("assets/images/burger.png")),
                        Container(
                            height: 36,
                            width: 36,
                            child: Image.asset("assets/images/brgr.png")),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //body
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //title
                          Container(
                            height: 24,
                            child: Row(
                              children: [
                                const Text(
                                  "Cheesy Burger",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: lightPrimaryColor),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                SvgPicture.asset("assets/icons/driveicon.svg"),
                              ],
                            ),
                          ),
                          //description
                          const SizedBox(
                              width: 120,
                              height: 36,
                              child: Text(
                                "Sandwich + Drink + 1 COB +Rice + Coleslaw",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                                maxLines: 2,
                              )),
                          const Spacer(),
                          //footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              const Text(
                                " E£",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              //proplem here
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .10,
                              ),
                              //mins
                              Container(
                                // height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: minsColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "-",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 9.0),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'badg'),
                                ),
                              ),
                              //plus
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: minsColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "+",
                                  style: TextStyle(color: Colors.white),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //card of products
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DismissibleHelper(
              confirmDismiss: (DismissDirection direction) {
                return showDialog(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: 150,
                        width: 250,
                        child: AlertDialog(
                          title: direction == DismissDirection.startToEnd
                              ? Center(
                                  child: Text(
                                  "askToMoveToCart".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: inProgressContantColor),
                                ))
                              : Center(
                                  child: Text(
                                  "deleteAsk".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: inProgressContantColor),
                                )),
                          actions: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    fontSize: 13,
                                    text:
                                        direction == DismissDirection.startToEnd
                                            ? "cartButton".tr
                                            : "deleteButton".tr,
                                    height: 39,
                                    width: 90,
                                    onPressed: () {
                                      direction == DismissDirection.startToEnd
                                          ? showDialog(
                                              builder: (context) {
                                                return AddItemToCart(
                                                    context, 3);
                                              },
                                              context: context)
                                          : Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  CustomButton(
                                    fontSize: 13,
                                    buttonColor: DeliveredContantColor,
                                    text: "cancelButton".tr,
                                    height: 39,
                                    width: 90,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      );
                    });
              },
              direction: DismissDirection.horizontal,
              key: const ValueKey(1),
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
                        child: SvgPicture.asset("assets/icons/cart.svg")),
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
                        child: const Icon(Icons.delete, color: Colors.white)),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
              ),
              child: Container(
                height: 131,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 20, color: Colors.black38)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    //image and logo
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                            height: 93,
                            width: 106,
                            child: Image.asset("assets/images/burger.png")),
                        Container(
                            height: 36,
                            width: 36,
                            child: Image.asset("assets/images/brgr.png")),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //body
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //title
                          Container(
                            height: 24,
                            child: Row(
                              children: [
                                const Text(
                                  "Cheesy Burger",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: lightPrimaryColor),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                SvgPicture.asset("assets/icons/driveicon.svg"),
                              ],
                            ),
                          ),
                          //description
                          const SizedBox(
                              width: 120,
                              height: 36,
                              child: Text(
                                "Sandwich + Drink + 1 COB +Rice + Coleslaw",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                                maxLines: 2,
                              )),
                          const Spacer(),
                          //footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              const Text(
                                " E£",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              //proplem here
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .10,
                              ),
                              //mins
                              Container(
                                // height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: minsColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "-",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 9.0),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'badg'),
                                ),
                              ),
                              //plus
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: minsColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "+",
                                  style: TextStyle(color: Colors.white),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //card of products
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DismissibleHelper(
              confirmDismiss: (DismissDirection direction) {
                return showDialog(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: 150,
                        width: 250,
                        child: AlertDialog(
                          title: direction == DismissDirection.startToEnd
                              ? Center(
                                  child: Text(
                                  "askToMoveToCart".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: inProgressContantColor),
                                ))
                              : Center(
                                  child: Text(
                                  "deleteAsk".tr,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: inProgressContantColor),
                                )),
                          actions: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    fontSize: 13,
                                    text:
                                        direction == DismissDirection.startToEnd
                                            ? "cartButton".tr
                                            : "deleteButton".tr,
                                    height: 39,
                                    width: 90,
                                    onPressed: () {
                                      direction == DismissDirection.startToEnd
                                          ? showDialog(
                                              builder: (context) {
                                                Navigator.pop(context);
                                                return AddItemToCart(
                                                    context, 3);
                                              },
                                              context: context)
                                          : Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  CustomButton(
                                    fontSize: 13,
                                    buttonColor: DeliveredContantColor,
                                    text: "cancelButton".tr,
                                    height: 39,
                                    width: 90,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      );
                    });
              },
              direction: DismissDirection.horizontal,
              key: const ValueKey(1),
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
                        child: SvgPicture.asset("assets/icons/cart.svg")),
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
                        child: const Icon(Icons.delete, color: Colors.white)),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
              ),
              child: Container(
                height: 131,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 20, color: Colors.black38)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    //image and logo
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                            height: 93,
                            width: 106,
                            child: Image.asset("assets/images/burger.png")),
                        Container(
                            height: 36,
                            width: 36,
                            child: Image.asset("assets/images/brgr.png")),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    //body
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //title
                          Container(
                            height: 24,
                            child: Row(
                              children: [
                                const Text(
                                  "Cheesy Burger",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: lightPrimaryColor),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                SvgPicture.asset("assets/icons/driveicon.svg"),
                              ],
                            ),
                          ),
                          //description
                          const SizedBox(
                              width: 120,
                              height: 36,
                              child: Text(
                                "Sandwich + Drink + 1 COB +Rice + Coleslaw",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                                maxLines: 2,
                              )),
                          const Spacer(),
                          //footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "250",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              const Text(
                                " E£",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textColor),
                              ),
                              //proplem here
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .10,
                              ),
                              //mins
                              Container(
                                // height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: minsColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "-",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 9.0),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'badg'),
                                ),
                              ),
                              //plus
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                    color: minsColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "+",
                                  style: TextStyle(color: Colors.white),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
