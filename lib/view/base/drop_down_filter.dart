import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/station_controller.dart';
import 'package:the_drive/data/model/response/station_model.dart';

class CustomDropDownFilter<T> extends StatefulWidget {
  String iconPath;
  List<T> dropDownList;
  String hintTxt;
  final void Function(T?) func;

  CustomDropDownFilter(
      {required this.iconPath,
      required this.dropDownList,
      required this.hintTxt,
      required this.func});

  @override
  State<CustomDropDownFilter<T>> createState() =>
      _CustomDropDownFilterState<T>();
}

class _CustomDropDownFilterState<T> extends State<CustomDropDownFilter<T>> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColorBorder, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: widget.dropDownList.map<DropdownMenuItem<T>>((value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(T.toString()),
        );
      }).toList(),
      onChanged: (selection) {
        widget.func(selection);
      },
      hint: Text(
        widget.hintTxt.tr,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, color: greyColorText),
      ),
      icon: SvgPicture.asset(widget.iconPath),
    ));
  }
}
