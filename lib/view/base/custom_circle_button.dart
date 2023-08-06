import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircularButton extends StatelessWidget {
  final String svgIconPath;
  final VoidCallback onPressed;

  const CustomCircularButton({
    Key? key,
    required this.svgIconPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 39,
        height: 39,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SvgPicture.asset(
          svgIconPath,
        ),
      ),
    );
  }
}
