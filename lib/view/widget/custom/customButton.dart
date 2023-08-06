// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;

  final List<Color> buttonColors;
  final Color? textColor;
  final double? fontSize;

  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisable;

  const CustomButton({
    required this.text,
    this.buttonColor,
    this.buttonColors = textButtonColors,
    this.textColor = Colors.white,
    this.fontSize,
    this.height = 57,
    this.width,
    this.borderRadius,
    this.onPressed,
    this.isLoading = false,
    this.isDisable = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable || isLoading ? null : onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisable ? Colors.grey : buttonColor,
          gradient: isDisable
              ? null
              : buttonColor != null
                  ? null
                  : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: buttonColors,
                    ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: isLoading == true
            ? const CupertinoActivityIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize ?? 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
