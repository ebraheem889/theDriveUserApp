// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;
  final bool isActive;

  const CategoryCard({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? null : Colors.white,
          gradient: !isActive
              ? null
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: textButtonColors,
                ),
          borderRadius: BorderRadius.circular(10),
          border: isActive
              ? null
              : Border.all(
                  color: const Color(0xFFE1E1E1),
                  width: 2,
                ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              color: isActive ? Colors.white : Colors.grey,
              width: 19,
              height: 19,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
