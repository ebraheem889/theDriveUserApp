import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_drive/controller/services/const/colors.dart';


class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final double? width;
  final double? height;
  final Color? color;
  final VoidCallback? onTap;
  final Color? iconColor;
  final bool isVisible;
  final String? shareLink;
  final bool allowShadow;

  const CustomIconButton({
    Key? key,
    required this.iconPath,
    this.width,
    this.height,
    this.color,
    this.onTap,
    this.iconColor,
    this.isVisible = true,
    this.shareLink,
    this.allowShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isVisible
        ? const SizedBox()
        : GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? lightPrimaryColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: allowShadow
              ? [
            BoxShadow(
              offset: -const Offset(0, 2),
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.3),
            ),
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.3),
            ),
          ]
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            color: iconColor ?? Colors.white,
            width: 18,
            height: 18,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
