import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/cubit/drive/states.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';

Widget checkInDialog(BuildContext context, tableNumber) {
  return BlocConsumer<DriverCubit, DriveStates>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, DriveStates state) {
      DriverCubit getData = DriverCubit.get(context);
      return AlertDialog(
        icon: Lottie.asset('assets/icons/checkouticon.json',
            height: 124, width: 124),
        title: Column(
          children: [
            Text(
              "dineDialogTitle".tr,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: inProgressContantColor),
            ),
            Text(
              "successfulyMsg".tr,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: inProgressContantColor),
            ),
            const SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "tableNumber".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: greyColor),
                ),
                Text(
                  tableNumber,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: inProgressContantColor),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "time".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: greyColor),
                ),
                const Text(
                  " 40 ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: inProgressContantColor),
                ),
                Text(
                  "min".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: greyColor),
                ),
                const SizedBox(
                  width: 4,
                ),
                SvgPicture.asset("assets/icons/inporgress_clock_icon.svg"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "checkOut".tr,
                height: 47,
                width: MediaQuery.of(context).size.width / 2,
                onPressed: (() {
                  Navigator.pop(context);
                  getData.faweryPayment();

                  // context.router.replace(HomeRoute());
                })),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      );
    },
  );
}
