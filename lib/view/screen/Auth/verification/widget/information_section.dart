import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/verification_controller.dart';
import 'package:the_drive/util/dimensions.dart';
import 'package:the_drive/util/styles.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class InformationSection extends StatelessWidget {
  const InformationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        barApp(context, "OTP Verification "),
        const SizedBox(
          height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Row(
            children: const [
              Text(
                "Enter the code we sent to:",
                style: TextStyle(fontSize: 18, color: greyColor),
              ),
            ],
          ),
        ),
        GetBuilder<RegisterController>(
          builder: (controller) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "(${"+20"}) ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "01061464012",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
