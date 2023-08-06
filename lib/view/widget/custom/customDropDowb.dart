// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class CustomDropDownForm<T> extends StatelessWidget {
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final T? value;
  const CustomDropDownForm({
    Key? key,
    this.hintText,
    required this.items,
    required this.onChanged,
    this.validator,
    this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      validator: validator,
      icon: SvgPicture.asset("assets/icons/dropDownIcon.svg"),
      iconEnabledColor: Colors.red,
      borderRadius: BorderRadius.circular(16),
      dropdownColor: Theme.of(context).colorScheme.onPrimaryContainer,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: const TextStyle(
          color: greyColor,
        ),
        errorStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
