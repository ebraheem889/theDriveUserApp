// ignore_for_file: curly_braces_in_flow_control_structures, avoid_types_as_parameter_names, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';
import 'package:the_drive/controller/add_on_controller.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/favorit_controller.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/helper/extensions.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/base/base_drawer.dart';
import 'package:the_drive/view/base/base_loader.dart';
import 'package:the_drive/view/base/cart.dart';
import 'package:the_drive/view/base/custom_snack_bar.dart';
import 'package:the_drive/view/screen/productdetails/product_counter_box.dart';
import 'package:the_drive/view/base/AddItemToCart.dart';
import 'package:the_drive/view/base/gustAlert.dart';
import 'package:the_drive/view/widget/custom/alerts/confirmChangePassWordScreen.dart';
import 'package:the_drive/view/widget/custom/custom_icon_button.dart';
import 'package:the_drive/view/base/custom_icon_size.dart';
import 'package:the_drive/view/widget/custom/custom_order_card.dart';
import 'package:the_drive/view/widget/custom/custom_pragraph.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home/cart_widget.dart';
import 'package:the_drive/view/base/add_to_card.dart';

class ProductDetails extends StatefulWidget {
  final int pickType;
  ItemModel menuModel;

  ProductDetails({super.key, required this.pickType, required this.menuModel});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _selectedSizeIndex = 0;

  bool isOpen = false;
  bool customizeOption1 = false;
  bool customizeOption2 = false;
  bool customizeOption3 = false;

  double hight = 165;
  Offset? old;
  Offset? newOld;
  bool isCartClick = false;
  int counter1 = 5;
  int counter = 1;

  double _totalAdsOn = 0;
  int _selectedIndex = -1;
  bool _isSheetOpen = false;
  late CartController _cartController;

  final valKey = GlobalKey<ScaffoldState>();
  late final POSDrawerController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = POSDrawerController(valKey);
    _loadData();
  }

  void _loadData() async {
    await Get.find<AddOnController>()
        .getProductAddOns(widget.menuModel.CategoryCode.toString());
    _cartController = Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Swipe(
      onSwipeRight: () => Navigator.pop(context),
      onSwipeUp: () {
        // if (getData.gustID == null)
        //   setState(() {
        //     hight = 615;
        //   });
      },
      onSwipeDown: () {
        // if (getData.gustID == null)
        //   setState(() {
        //     hight = 165;
        //   });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: valKey,
        endDrawer: ValueListenableBuilder<Widget>(
          valueListenable: controller,
          builder: (context, value, child) {
            return value;
          },
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFF06BFB6),
        appBar: _appBar(),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF5B5388),
                    Color(0xFF06BFB6),
                  ],
                ),
              ),
              child: Column(
                children: [
                  100.ph,
                  //imag of product
                  Image.asset(
                    widget.pickType == 5
                        ? "assets/images/icecream.png"
                        : widget.pickType == 6
                            ? "assets/images/hotdog.png"
                            : "assets/images/burger2.png",
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                  20.ph,
                  DotsIndicator(
                    dotsCount: 4,
                    position: 0.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Colors.white,
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.transparent,
                      spacing: const EdgeInsets.all(5.0).copyWith(bottom: 10),
                      size: const Size(10, 10),
                      activeSize: const Size(12, 12),
                    ),
                  ),
                  20.ph,
                  GetBuilder<CartController>(builder: ((controller) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIconButton(
                            iconPath: "assets/icons/minus.svg",
                            onTap: () =>
                                controller.addItemToCart(widget.menuModel, -1),
                          ),
                          20.pw,
                          Text(
                            controller.getQuentity(widget.menuModel).toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // end of product quantity
                          20.pw,
                          CustomIconButton(
                            iconPath: "assets/icons/plus.svg",
                            onTap: () => controller.addItemToCart(
                                widget.menuModel, 1,
                                addsOnTotalPrice: _totalAdsOn),
                          ),
                          // end of increment
                        ],
                      ),
                    );
                  })),
                  20.ph,
                  Container(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            widget.menuModel.itemName.toString(),
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  )),
                  // end of product name

                  21.ph,
                  Container(
                      height: 100,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.menuModel.productDescription.toString(),
                          maxLines: 5,
                          style: TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                  // end of product description
                  24.ph,
                  _productSizeSelection()
                  // end of product size
                ],
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
            height: hight.abs(),
            width: MediaQuery.of(context).size.width,
            // height: isOpen ? 650: 165,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: [
                Container(
                  child: GestureDetector(
                    onTap: (() {
                      if (hight <= 165) {
                        setState(() {
                          hight = 615;
                        });
                      } else {
                        setState(() {
                          hight = 165;
                        });
                      }
                      // }
                    }),
                    onVerticalDragEnd: (_) {
                      setState(() {
                        old = null;
                      });
                    },
                    onVerticalDragCancel: () {
                      setState(() {
                        old = null;
                      });
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(.3),
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [],
                        ),
                        duration: const Duration(milliseconds: 300),
                        height: hight.abs(),
                        width: context.width,
                        child: hight <= 200
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  InkWell(
                                    onTap: () => _setOpendSheetHeight(),
                                    child: SizedBox(
                                      height: 40,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/custmoize_order.svg",
                                          ),
                                          Text(
                                            "customizeOrderButtonTitle".tr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              )
                            : OverflowBox(
                                maxHeight: context.height,
                                child: Container(
                                  height: context.height / 1.2,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        //down arrow
                                        Center(
                                          child: InkWell(
                                            onTap: () => _setOpendSheetHeight(),
                                            child: SizedBox(
                                              height: 24,
                                              child: SvgPicture.asset(
                                                  "assets/icons/uncustomize_order.svg"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 19,
                                        ),

                                        GetBuilder<AddOnController>(
                                            builder: ((AddOnController) {
                                          return AddOnController.isLoading
                                              ? Expanded(
                                                  child: Container(
                                                  child: AppLoader(
                                                    loaderView:
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: 5,
                                                            itemBuilder:
                                                                ((context,
                                                                    index) {
                                                              return Container(
                                                                width: context
                                                                    .width,
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      height: _selectedIndex ==
                                                                              index
                                                                          ? 333
                                                                          : 57,
                                                                      width: context
                                                                              .width /
                                                                          1.1,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Theme.of(context)
                                                                            .scaffoldBackgroundColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          11,
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            })),
                                                  ),
                                                ))
                                              : Expanded(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: AddOnController
                                                          .addonsCategoriesList
                                                          .length,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return InkWell(
                                                            onTap: () {
                                                              _handleOpenClose(
                                                                  index);
                                                              // setState(() {
                                                              //   customizeOption2 =
                                                              //       false;
                                                              //   customizeOption3 =
                                                              //       false;
                                                              //   customizeOption1 =
                                                              //       !customizeOption1;
                                                              //   print(
                                                              //       customizeOption1);
                                                              // });
                                                            },
                                                            child: Container(
                                                              width:
                                                                  context.width,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: _selectedIndex ==
                                                                            index
                                                                        ? 333
                                                                        : 57,
                                                                    width: context
                                                                            .width /
                                                                        1.1,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .scaffoldBackgroundColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            13.0,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          const SizedBox(
                                                                            height:
                                                                                19,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                AddOnController.addonsCategoriesList[index].addonsType!.toString(),
                                                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              const Spacer(),
                                                                              _selectedIndex == index ? SvgPicture.asset("assets/icons/arrow_down.svg") : RotatedBox(quarterTurns: localNotifair.value == "ar" ? -2 : 0, child: SvgPicture.asset("assets/icons/cusomizeIcon.svg")),
                                                                            ],
                                                                          ),
                                                                          Visibility(
                                                                              visible: _selectedIndex == index,
                                                                              child: CheckboxListTile(
                                                                                checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                                                secondary: Image.asset("assets/images/custom11.png"),
                                                                                value: AddOnController.addonsCategoriesList[index].isSelected,
                                                                                onChanged: (v) {
                                                                                  _setAdsOn(AddOnController.addonsCategoriesList[index].addonPrice!, v!);
                                                                                  setState(() {
                                                                                    AddOnController.addonsCategoriesList[index].isSelected = v;
                                                                                  });
                                                                                },
                                                                                title: Text(
                                                                                  AddOnController.addonsCategoriesList[index].addonItemName!.en.toString(),
                                                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                                                                ),
                                                                                // end of title
                                                                                subtitle: Text(
                                                                                  "${AddOnController.addonsCategoriesList[index].addonPrice!} EGP",
                                                                                  style: TextStyle(fontSize: 12),
                                                                                ),
                                                                                // end of item price
                                                                                activeColor: lightSecondaryColor,
                                                                              ))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 11,
                                                                  )
                                                                ],
                                                              ),
                                                            ));
                                                      })),
                                                );
                                        })),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                //footer
                Align(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<FavoritController>(
                              builder: ((favoritController) {
                            return CustomIconButton(
                              height: 50,
                              width: 50,
                              allowShadow: true,
                              color: Colors.white,
                              iconColor: favoritController
                                      .isExistInFavorit(widget.menuModel)
                                  ? Colors.red
                                  : Colors.grey,
                              iconPath: "assets/icons/heart.svg",
                              onTap: () {
                                if (favoritController
                                    .isExistInFavorit(widget.menuModel)) {
                                  favoritController
                                      .removeFromFavorit(widget.menuModel);
                                  showCustomSnackBar("Removed From Favorits!");
                                } else {
                                  favoritController.addToFavorit(
                                      widget.menuModel, 1);
                                  showCustomSnackBar(
                                      "Successfully Added To Favorits !",
                                      isError: false);
                                }
                              },
                            );
                          })),
                          // end of add to favorits
                          AddToCartButton(
                            itemPrice:
                                "${widget.menuModel.itemPrice! + _totalAdsOn}",
                            onPressed: () {
                              _cartController.addItemToCart(widget.menuModel, 1,
                                  addsOnTotalPrice: _totalAdsOn,
                                  isCustom: true);

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddItemToCart(context, 1);
                                  });
                            },
                          ),
                          // end of add to cart
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setAdsOn(double adsPrice, bool checked) {
    if (checked) {
      _totalAdsOn += adsPrice;
    } else {
      if (_totalAdsOn == 0) {
      } else {
        _totalAdsOn -= adsPrice;
      }
    }
  }

  void _setOpendSheetHeight() {
    if (hight <= 200) {
      setState(() {
        hight = 640;
      });
    } else {
      setState(() {
        hight = 165;
      });
    }
  }

  void _handleOpenClose(int index) {
    if (index == _selectedIndex) {
      setState(() {
        _selectedIndex = -1;
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: RotatedBox(
            quarterTurns: localNotifair.value == "ar" ? -2 : 0,
            child: SvgPicture.asset(
              "assets/icons/back.svg",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: () {
              controller.openDrawer(cartView());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(
                "assets/icons/cart-circle-plus.svg",
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _productSizeSelection() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizeIcon(isSelected: false, sizeTitle: widget.menuModel.size),
          const SizedBox(
            width: 24,
          ),
          // GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _selectedSizeIndex = 1;
          //       });
          //     },
          //     child: SizeIcon(
          //         isSelected: _selectedSizeIndex == 1, sizeTitle: "M")),
          // const SizedBox(
          //   width: 24,
          // ),
          // GestureDetector(
          // onTap: () {
          //   setState(() {
          //     _selectedSizeIndex = 2;
          //   });
          // },
          // child: SizeIcon(
          //     isSelected: _selectedSizeIndex == 2, sizeTitle: "L")),
        ],
      ),
    );
  }

//  onVerticalDragUpdate: (DragUpdateDetails _) {
//                       if (_.delta.dy < -30) {
//                         setState(() {
//                           hight = 640;
//                         });
//                         return;
//                       } else if (_.delta.dy > 30) {
//                         setState(() {
//                           hight = 165;
//                         });
//                         return;
//                       }

//                       if (hight < 640) {
//                         customizeOption1 = false;
//                         customizeOption2 = false;
//                         customizeOption3 = false;
//                       }
//                       ;
//                       if (old == null) {
//                         old = _.localPosition;
//                         newOld = _.localPosition;
//                       } else {
//                         if (newOld!.dy == _.localPosition.dy) return;
//                         final diffrence =
//                             _.localPosition.dy.toInt() - newOld!.dy.toInt();
//                         final newHeight = hight - diffrence.toInt();
//                         if (newHeight <= 640 && newHeight >= 165) {
//                           setState(() {
//                             hight = newHeight;
//                           });
//                           newOld = _.localPosition;
//                         }
//                       }
//                     },

}
