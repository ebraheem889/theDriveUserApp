import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/view/widget/custom/custom_title.dart';
import 'package:the_drive/view/widget/home_station/custom_picj_up%20card.dart';

class ChoosePickupsList extends StatefulWidget {
  final void Function(int index)? onTap;
  final int? selectedIndex;
  const ChoosePickupsList({Key? key, this.onTap, required this.selectedIndex})
      : super(key: key);

  @override
  State<ChoosePickupsList> createState() => _ChoosePickupsListState();
}

class _ChoosePickupsListState extends State<ChoosePickupsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(
          title: "pickupHeader".tr,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PickupCard(
              tap: () => widget.onTap?.call(1),
              isSelected: widget.selectedIndex == 1,
              svgIconPath: "assets/icons/spon.svg",
              title: "dineIn".tr,
            ),
            const SizedBox(
              width: 44,
            ),
            PickupCard(
              isSelected: widget.selectedIndex == 2,
              tap: () => widget.onTap?.call(2),
              svgIconPath: "assets/icons/car.svg",
              title: "driveThru".tr,
            ),
            const SizedBox(
              width: 44,
            ),
            PickupCard(
              isSelected: widget.selectedIndex == 3,
              tap: () => widget.onTap?.call(3),
              svgIconPath: "assets/icons/box-hand.svg",
              title: "window".tr,
            ),
          ],
        )
      ],
    );
  }
}
