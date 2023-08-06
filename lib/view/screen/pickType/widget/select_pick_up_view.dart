import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class SelectPickUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "pickupHeader".tr,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: inProgressContantColor),
            ),
            Text(
              "instractorMsg".tr,
              style:
                  const TextStyle(fontSize: 14, color: inProgressContantColor),
            ),
            const SizedBox(
              height: 36,
            ),
            SvgPicture.asset("assets/images/choose_pick_up.svg"),
          ],
        ),
      ),
    );
  }
}
