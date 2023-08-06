import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cart_controller.dart';
import 'package:the_drive/data/model/response/item_model.dart';
import 'package:the_drive/view/widget/custom/custom_icon_button.dart';

class ProductCounterBox extends StatefulWidget {
  ItemModel menuModel;
  ProductCounterBox({required this.menuModel});

  @override
  State<ProductCounterBox> createState() => _ProductCounterBoxState();
}

class _ProductCounterBoxState extends State<ProductCounterBox> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: ((controller) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              iconPath: "assets/icons/minus.svg",
              onTap: () => controller.addItemToCart(widget.menuModel, -1),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              controller.getQuentity(widget.menuModel).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            CustomIconButton(
              iconPath: "assets/icons/plus.svg",
              onTap: () => controller.addItemToCart(widget.menuModel, 1),
            ),
          ],
        ),
      );
    }));
  }
}
