import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_drive/controller/services/const/colors.dart';

Widget customCheckButton (
{
  context,width,height,onPressed,buttonColor,isDisable,isLoading,text,fontSize
}
    )
{
  return  GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:buttonColor,
        gradient: isDisable
            ? null
            : buttonColor != null
            ? null
            : LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: buttonColor,
        ),
        borderRadius: BorderRadius.circular(10),
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