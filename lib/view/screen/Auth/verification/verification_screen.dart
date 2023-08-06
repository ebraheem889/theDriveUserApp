import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/auth_controller.dart';
import 'package:the_drive/controller/registerController.dart';
import 'package:the_drive/controller/verification_controller.dart';
import 'package:the_drive/util/dimensions.dart';
import 'package:the_drive/view/base/custom_pincode_field.dart';
import 'package:the_drive/view/screen/Auth/verification/widget/information_section.dart';
import 'package:the_drive/view/screen/Auth/verification/widget/timer_section.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  InformationSection(),
                  const SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),

                  GetBuilder<VerificationController>(builder: (getController) {
                    return CustomPinCodeField(
                      onCompleted: (pin) {
                        getController.setOtp(pin);
                        // String _phoneNumber =
                        //     Get.find<RegisterController>().phoneNumber;
                        String _phoneNumber = "123123123123";
                        Get.find<AuthController>()
                            .phoneVerify(_phoneNumber, pin);
                      },
                    );
                  }),

                  // DemoOtpHint(),

                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  TimerSection(),
                ],
              ),
            ),
          ),
          GetBuilder<AuthController>(
              builder: (controller) => Container(
                    height: 100,
                    child: controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor),
                          )
                        : Container(),
                  ))
        ],
      ),
    );
  }
}
