// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

Widget confirmAlert(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    actionsAlignment: MainAxisAlignment.center,
    actionsPadding: const EdgeInsets.only(bottom: 32),
    icon: SizedBox(
        height: 91,
        width: 91,
        child: Image.asset("assets/images/confirmChngePass.png")),
    title: const Text("Your Password Successfully Changed ",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: inProgressContantColor)),
  );
}
