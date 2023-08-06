import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? radius;
  String itemPrice;

  AddToCartButton(
      {required this.onPressed, this.radius, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: textButtonColors,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                " ${itemPrice} ${"egyptCurrency".tr}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "addToCartButtonTitle".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              RotatedBox(
                  quarterTurns: localNotifair.value == "ar" ? -2 : 0,
                  child: SvgPicture.asset("assets/icons/arrow-right.svg"))
            ],
          ),
        ),
      ),
    );
  }
}
