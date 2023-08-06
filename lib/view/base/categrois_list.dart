import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/base/categroy_card.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      color: greyColor.withOpacity(0.04),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Row(
          children: [
            //All
            CategoryCard(
              onPressed: () {
                setState(() {
                  // selectedCategoryIndex = index;
                });
              },
              text: "allNotification".tr,
              iconPath: "assets/icons/union.svg",
              isActive: true,
            ),
            const SizedBox(
              width: 20,
            ),
            //Fast Food
            CategoryCard(
              onPressed: () {
                setState(() {});
              },
              text: "fastfoodTitle".tr,
              iconPath: "assets/icons/fast_food.svg",
              // isActive: selectedCategoryIndex == index,
            ),
            const SizedBox(
              width: 20,
            ),
            //Drinks
            CategoryCard(
              onPressed: () {
                setState(() {});
              },
              text: "drinksTitle".tr,
              iconPath: "assets/icons/drinks.svg",
              // isActive: selectedCategoryIndex == index,
            ),
            const SizedBox(
              width: 20,
            ),
            //Side item
            CategoryCard(
              onPressed: () {
                setState(() {});
              },
              text: "slideItemTitle".tr,
              iconPath: "assets/icons/side_item.svg",
              // isActive: selectedCategoryIndex == index,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ]),
    );
  }
}
