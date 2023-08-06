import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/registerController.dart';

import '../../../../../controller/verification_controller.dart';
import '../../../../../util/dimensions.dart';

class TimerSection extends StatelessWidget {
  const TimerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationController>(builder: (controller) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: controller.visibility == true ? true : false,
            child: InkWell(
              onTap: () {
                controller.startTimer();
                controller.setVisibility(false);
                Get.find<AuthController>().resendOtp(
                    phoneNumber: Get.find<RegisterController>().phoneNumber);
              },
              child: Text(
                'resend'.tr,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: Dimensions.fontSizeExtraLarge,
                ),
              ),
            ),
          ),
          Visibility(
            visible: controller.visibility == true ? false : true,
            child: Text(
              "Resend code in : " '${controller.maxSecond}' +
                  " " +
                  'seconds'.tr,
              style: TextStyle(
                color: Colors.grey,
                fontSize: Dimensions.fontSizeExtraLarge,
              ),
            ),
          ),
        ],
      );
    });
  }
}
