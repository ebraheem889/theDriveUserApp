import 'package:flutter/material.dart';

Widget customProductText({
  context,
  String? paragraph,
  Color? paragraphColor,
  TextAlign? textAlign,
  int? maxLines,
}) {
  return Text(
    paragraph!,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: paragraphColor,
    ),
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxLines,
    overflow: maxLines == null ? null : TextOverflow.ellipsis,
  );
}
