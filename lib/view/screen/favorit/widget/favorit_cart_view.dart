import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/controller/favorit_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/dissimisable_helper.dart';
import 'package:the_drive/data/model/body/cart_item.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/util/images.dart';

class FavoritItemView extends StatefulWidget {
  int pickType;
  ItemModel ItemData;

  FavoritItemView({required this.pickType, required this.ItemData});

  @override
  State<FavoritItemView> createState() => _FavoritItemViewState();
}

class _FavoritItemViewState extends State<FavoritItemView> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritController>(builder: ((favoritController) {
      return Container(
        clipBehavior: Clip.hardEdge,
        height: 131,
        decoration: BoxDecoration(
            border: isSelected == true
                ? Border.all(color: headTitleColor, width: 4)
                : null,
            boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black38)],
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
                    child: Image.asset(Images.BURGER_LOGO)),
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
                  SizedBox(
                    height: 23,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          child: Text(
                            widget.ItemData.itemName.toString(),
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: lightPrimaryColor),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                        ),
                        widget.pickType == 1
                            ? Image.asset("assets/images/dineInIcon.png")
                            : const Text(""),
                        widget.pickType == 2
                            ? SvgPicture.asset("assets/icons/driveicon.svg")
                            : const Text(""),
                        widget.pickType == 3
                            ? Image.asset("assets/images/inhandIcon.png")
                            : const Text(""),
                      ],
                    ),
                  ),
                  // end of cart title and pick type

                  SizedBox(
                      width: 120,
                      height: 38,
                      child: Text(
                        widget.ItemData.productDescription.toString(),
                        style: TextStyle(
                          fontSize: 11,
                        ),
                        maxLines: 2,
                      )),

                  // end of description
                  const Spacer(),
                  //footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.ItemData.itemPrice.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                      const Text(
                        "E£",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                      //proplem here
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .10,
                      ),

                      GestureDetector(
                        onTap: () {
                          favoritController.addToFavorit(widget.ItemData, -1);
                        },
                        child: Container(
                          // height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: minsColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                              child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          favoritController
                              .getQuentity(widget.ItemData)
                              .toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'badg'),
                        ),
                      ),
                      //plus
                      GestureDetector(
                        onTap: () {
                          favoritController.addToFavorit(widget.ItemData, 1);
                        },
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: minsColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                              child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          )),
                        ),
                      )
                    ],
                  )
                  // end of cart actions and price
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
