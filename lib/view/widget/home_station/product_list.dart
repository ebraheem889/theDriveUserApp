// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:the_drive/view/widget/home_station/product_card.dart';

class ProductsList extends StatelessWidget {
  final void Function(int index)? onTap;

  ProductsList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        // shrinkWrap: true,
        itemCount: 5,
        primary: true,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(onTap: () => onTap?.call(index), child: const ProductCard()),
              SizedBox(
                height: index == 4 ? 500 : 20,
              )
            ],
          );
        },
      ),
    );
  }
}
