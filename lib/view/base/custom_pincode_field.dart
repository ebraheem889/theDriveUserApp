import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class CustomPinCodeField extends StatelessWidget {
  final Function onCompleted;
  final double padding;
  const CustomPinCodeField({required this.onCompleted, this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = greyColor;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Pinput(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onCompleted: (S) => onCompleted,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 9),
                width: 22,
                height: 1,
                color: focusedBorderColor,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ));
  }
}
