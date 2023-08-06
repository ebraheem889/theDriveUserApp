// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison, non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable, avoid_print, sized_box_for_whitespace
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/services/dissimisable_helper.dart';
import 'package:the_drive/view/widget/custom/alerts/checkOutByVisa.dart';
import 'package:the_drive/view/widget/custom/alerts/scanQrCodeAlert.dart';

class CartScreen extends StatefulWidget {
  int pickType;

  CartScreen({
    Key? key,
    required this.pickType,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverCubit, DriveStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        DriverCubit getData = DriverCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                "cartPageTitle".tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
              ),
              leading: IconButton(
                  icon: RotatedBox(
                      quarterTurns: localNotifair.value == "ar" ? -2 : 0,
                      child:
                          SvgPicture.asset("assets/icons/blue_arrow_back.svg")),
                  onPressed: (() {
                    print("=======================>Test");
                    print(widget.pickType);
                    // widget.pickType == null
                    //     ? context.router.pop()
                    //     : context.router.replace(PickupTypeRoute(pickupType: widget.pickType));
                  }))),
          body: Column(
            children: [
              const SizedBox(
                height: 22,
              ),
              const SizedBox(
                height: 40,
              ),
              //card of products
              GestureDetector(
                onTap: () {
                  print(widget.pickType);
                  setState(() {
                    isSelected = !isSelected;
                    print(isSelected);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DismissibleHelper(
                    direction: DismissDirection.endToStart,
                    key: const ValueKey(0),
                    background: Container(
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
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 131,
                      decoration: BoxDecoration(
                          border: isSelected == true
                              ? Border.all(color: headTitleColor, width: 4)
                              : null,
                          boxShadow: const [
                            BoxShadow(blurRadius: 20, color: Colors.black38)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          //image and logo
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                  height: 93,
                                  width: 106,
                                  child:
                                      Image.asset("assets/images/burger.png")),
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
                                SizedBox(
                                  height: 23,
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
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      ),
                                      widget.pickType == 1
                                          ? Image.asset(
                                              "assets/images/dineInIcon.png")
                                          : const Text(""),
                                      widget.pickType == 2
                                          ? SvgPicture.asset(
                                              "assets/icons/driveicon.svg")
                                          : const Text(""),
                                      widget.pickType == 3
                                          ? Image.asset(
                                              "assets/images/inhandIcon.png")
                                          : const Text(""),
                                    ],
                                  ),
                                ),

                                //description
                                const SizedBox(
                                    width: 120,
                                    height: 38,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      width: MediaQuery.of(context).size.width *
                                          .10,
                                    ),
                                    //mins
                                    Container(
                                      // height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        "-",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.0),
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
              ),
              //card of products
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  print(widget.pickType);
                  setState(() {
                    isSelected = !isSelected;
                    print(isSelected);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DismissibleHelper(
                    direction: DismissDirection.endToStart,
                    key: const ValueKey(0),
                    background: Container(
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
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 131,
                      decoration: BoxDecoration(
                          border: isSelected == true
                              ? Border.all(color: headTitleColor, width: 4)
                              : null,
                          boxShadow: const [
                            BoxShadow(blurRadius: 20, color: Colors.black38)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          //image and logo
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                  height: 93,
                                  width: 106,
                                  child:
                                      Image.asset("assets/images/burger.png")),
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
                                SizedBox(
                                  height: 23,
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
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      ),
                                      widget.pickType == 1
                                          ? Image.asset(
                                              "assets/images/dineInIcon.png")
                                          : const Text(""),
                                      widget.pickType == 2
                                          ? SvgPicture.asset(
                                              "assets/icons/driveicon.svg")
                                          : const Text(""),
                                      widget.pickType == 3
                                          ? Image.asset(
                                              "assets/images/inhandIcon.png")
                                          : const Text(""),
                                    ],
                                  ),
                                ),

                                //description
                                const SizedBox(
                                    width: 120,
                                    height: 38,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      width: MediaQuery.of(context).size.width *
                                          .10,
                                    ),
                                    //mins
                                    Container(
                                      // height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        "-",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.0),
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
              ),
              //card of products
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  print(widget.pickType);
                  setState(() {
                    isSelected = !isSelected;
                    print(isSelected);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DismissibleHelper(
                    direction: DismissDirection.endToStart,
                    key: const ValueKey(0),
                    background: Container(
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
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 131,
                      decoration: BoxDecoration(
                          border: isSelected == true
                              ? Border.all(color: headTitleColor, width: 4)
                              : null,
                          boxShadow: const [
                            BoxShadow(blurRadius: 20, color: Colors.black38)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          //image and logo
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                  height: 93,
                                  width: 106,
                                  child:
                                      Image.asset("assets/images/burger.png")),
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
                                SizedBox(
                                  height: 23,
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
                                            MediaQuery.of(context).size.width *
                                                .05,
                                      ),
                                      widget.pickType == 1
                                          ? Image.asset(
                                              "assets/images/dineInIcon.png")
                                          : const Text(""),
                                      widget.pickType == 2
                                          ? SvgPicture.asset(
                                              "assets/icons/driveicon.svg")
                                          : const Text(""),
                                      widget.pickType == 3
                                          ? Image.asset(
                                              "assets/images/inhandIcon.png")
                                          : const Text(""),
                                    ],
                                  ),
                                ),

                                //description
                                const SizedBox(
                                    width: 120,
                                    height: 38,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      width: MediaQuery.of(context).size.width *
                                          .10,
                                    ),
                                    //mins
                                    Container(
                                      // height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: minsColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                          child: Text(
                                        "-",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 9.0),
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
              ),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 109,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 109,
                      width: 376,
                      child: GestureDetector(
                        onTap: () {
                          //==============================>cart dialog here
                          if (widget.pickType == 1) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return scanQrCodeWidget(context);
                                });
                          } else {
                            getData.faweryPayment();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return checkOutByVisa(context);
                                });
                          }
                        },
                        child: Container(
                          height: 52,
                          width: 340,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: textButtonColors,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " 55 ${"egyptCurrency".tr}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 128,
                                ),
                                Text(
                                  "checkOut".tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RotatedBox(
                                    quarterTurns:
                                        localNotifair.value == "ar" ? -2 : 0,
                                    child: SvgPicture.asset(
                                        "assets/icons/arrow-right.svg"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
