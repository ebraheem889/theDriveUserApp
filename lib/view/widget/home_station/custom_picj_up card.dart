// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/widget/home_station/linear_griden_mask.dart';

class PickupCard extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final bool isSelected;
  GestureTapCallback? tap;

  PickupCard({
    Key? key,
    required this.svgIconPath,
    required this.tap,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(
      svgIconPath,
      height: 30,
      width: 30,
      fit: BoxFit.cover,
    );
    return InkWell(
      onTap: tap,
      child: SizedBox(
        height: 75,
        // width: 61,
        child: Column(
          children: [
            if (isSelected)
              LinearGradientMask(
                colors: const [
                  Color(0xFF06BFB6),
                  Color(0xFF5B5388),
                ],
                child: icon,
              )
            else
              icon,
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? lightSecondaryColor : greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
