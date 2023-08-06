// ignore_for_file: file_names, unnecessary_brace_in_string_interps, body_might_complete_normally_nullable, sort_child_properties_last, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

Widget defaultTextForm(
        {controller,
        hintText,
        dynamic type,
        msg,
        dynamic visableIcon,
        bool passwd = false,
        ValueChanged<String>? onSubmitted,
        GestureTapCallback? onTap}) =>
    SizedBox(
      height: 57,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 13,
        ),
        obscureText: passwd == false ? false : true,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        keyboardType: type,
        validator: (String? value) {
          if (value!.isEmpty) {
            return '${msg}';
          }
        },
        decoration: InputDecoration(
          suffixIcon: InkWell(
            child: Icon(visableIcon),
            onTap: onTap,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(),
          ),
          hintText: "${hintText}",
        ),
      ),
    );
