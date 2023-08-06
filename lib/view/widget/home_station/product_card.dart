import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_circle_button.dart';
import 'package:the_drive/view/widget/custom/custom_pragraph.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.white,
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
            // img behind the img of item
            Positioned(
              right: -35,
              top: 0,
              bottom: 0,
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
            //img of item
            Positioned(
              right: 10,
              top: 0,
              bottom: 0,
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
            Positioned(
              left: localNotifair.value == "ar" ? 16 : 20,
              top: localNotifair.value == "ar" ? 10 : 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 250,
                child: Column(
                  children: [
                    const Text(
                      "Classic Cheese Burger Beef",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    customProductText(
                        context: context,
                        paragraph:
                            'Lorem Ipsum is simply dummy text of the printing and ',
                        paragraphColor: greyColor,
                        maxLines: 2,
                        textAlign: TextAlign.left),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        CustomButton(
                          fontSize: 13,
                          text: "120 ${"egyptCurrency".tr}",
                          onPressed: () {},
                          width: 58,
                          height: 32,
                          borderRadius: 10,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        CustomCircularButton(
                          onPressed: () {},
                          svgIconPath: "assets/icons/heart.svg",
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        CustomCircularButton(
                          onPressed: () {},
                          svgIconPath: "assets/icons/cart-plus.svg",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//test
