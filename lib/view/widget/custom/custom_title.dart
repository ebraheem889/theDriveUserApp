import 'package:flutter/material.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  final bool? haveNavigationButton;
  final String? trailingTitle;
  final VoidCallback? onTrailingWidgetPress;
  final Color? titleColor;
  final Color? trailingTitleColor;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomTitle({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.haveNavigationButton,
    this.onTrailingWidgetPress,
    this.trailingTitle,
    this.titleColor,
    this.trailingTitleColor,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: titleColor ?? textColor,
              fontSize: fontSize ?? 21,
              fontWeight: fontWeight ?? FontWeight.w700,
              overflow: TextOverflow.ellipsis),
        ),
        if (haveNavigationButton == true)
          const Text("")
        // todo icon nav
        else if (trailingTitle != null)
          GestureDetector(
            onTap: onTrailingWidgetPress,
            child: Text(
              trailingTitle!,
              style: TextStyle(
                  color: trailingTitleColor ?? redColor,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
          )
      ],
    );
  }
}
