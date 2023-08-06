// ignore_for_file: use_key_in_widget_constructors, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/view/widget/custom/customButton.dart';
import 'package:the_drive/view/base/custom_appBar.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final stationList = <String>['BurgerKing', 'StarBucks'];
  final opinionListEn = <String>['Suggestion', 'Complain'];
  final opinionListAr = <String>['مقترح', 'شكوى'];
  String? stationDropdownValue;
  String? opinionDropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              barApp(context, "contactUsTitle".tr),
              const SizedBox(
                height: 52,
              ),
              Text(
                "contactUsGreating".tr,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: inProgressContantColor),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "contactUsGreating2".tr,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: greyColor),
              ),
              const SizedBox(
                height: 30,
              ),
              //drop down list
              SizedBox(
                height: 42,
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        icon: SvgPicture.asset("assets/icons/dropDownIcon.svg"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: lightPrimaryColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        hint: Text(
                          "stationTitle".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: greyColor),
                        ),
                        value: stationDropdownValue,
                        items: stationList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (Object? value) {},
                      ),
                    ),
                    const SizedBox(
                      width: 38,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                        icon: SvgPicture.asset("assets/icons/dropDownIcon.svg"),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: lightPrimaryColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(),
                          ),
                        ),
                        hint: Text(
                          "opinion".tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: greyColor),
                        ),
                        value: opinionDropdownValue,
                        items: localNotifair.value == 'en'
                            ? opinionListEn
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()
                            : opinionListAr
                                .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                        onChanged: (Object? value) {
                          setState(() {
                            opinionDropdownValue = value as String?;
                          });

                          print(value as String);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: lightPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    //<-- SEE HERE
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: lightPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(18),
                    //<-- SEE HERE
                  ),
                ),
              ),
              if (opinionDropdownValue == opinionListEn[1] ||
                  opinionDropdownValue == opinionListAr[1])
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      //phone number
                      Container(
                          height: 22,
                          child: Text(
                            "phoneNumberTitle".tr,
                            style:
                                const TextStyle(fontSize: 13, color: greyColor),
                          )),
                      const SizedBox(
                        height: 11,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: IntlPhoneField(
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          decoration: InputDecoration(
                            hintText: "phoneNumberTitle".tr,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'EG',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                  height: opinionDropdownValue == opinionListEn[1] ||
                          opinionDropdownValue == opinionListAr[1]
                      ? MediaQuery.of(context).size.height / 37
                      : MediaQuery.of(context).size.height / 11),
              CustomButton(
                text: "contactUsButton".tr,
              ),
              const SizedBox(
                height: 71,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
