import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function onSubmit;
  final String? Function(String?)? validate;
  final bool isEnabled;
  final int maxLines;
  final void Function(String?)? onChanged;
  final TextCapitalization capitalization;
  final dynamic prefixIcon;
  final dynamic sufexfixIcon;
  final double prefixSize;
  final bool divider;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;
  final bool isFilled;
  final int length;

  CustomTextField(
      {this.hintText = 'Write something...',
      required this.controller,
      required this.focusNode,
      this.nextFocus,
      this.isEnabled = true,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.validate,
      required this.onSubmit,
      required this.onChanged,
      required this.prefixIcon,
      this.capitalization = TextCapitalization.none,
      this.isPassword = false,
      this.sufexfixIcon,
      this.prefixSize = Dimensions.PADDING_SIZE_SMALL,
      this.divider = false,
      this.textAlign = TextAlign.start,
      this.isAmount = false,
      this.isNumber = false,
      this.showTitle = false,
      this.isFilled = false,
      this.length = 0});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(widget.hintText,
                style: arabicmaincairoRegular.copyWith(
                    fontSize: Dimensions.fontSizeSmall))
            : SizedBox(),
        SizedBox(
            height: widget.showTitle ? Dimensions.PADDING_SIZE_EXTRA_SMALL : 0),
        TextFormField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign,
            style: arabicmaincairoRegular.copyWith(
                fontSize: Dimensions.fontSizeLarge),
            textInputAction: widget.nextFocus == null
                ? TextInputAction.done
                : widget.inputAction,
            keyboardType:
                widget.isAmount ? TextInputType.number : widget.inputType,
            cursorColor: Theme.of(context).primaryColor,
            textCapitalization: widget.capitalization,
            enabled: widget.isEnabled,
            autofocus: false,
            onChanged: widget.onChanged,
            maxLength:
                widget.isNumber || widget.length > 0 ? widget.length : null,
            obscureText: widget.isPassword ? _obscureText : false,
            inputFormatters: widget.inputType == TextInputType.phone
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ]
                : widget.isAmount
                    ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
                    : widget.isNumber
                        ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                        : null,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Color(0xff06BFB6),
                    width: 1.0,
                  )),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10),
                borderSide: new BorderSide(),
              ),
              isDense: true,
              hintText: widget.hintText,
              hintStyle: arabicmaincairoRegular.copyWith(
                  fontSize: 13, color: Theme.of(context).hintColor),
              filled: widget.isFilled,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: widget.prefixSize),
                      child:
                          Image.asset(widget.prefixIcon, height: 20, width: 20),
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                      onPressed: _toggle,
                    )
                  : widget.sufexfixIcon != null
                      ? widget.sufexfixIcon
                      : null,
            ),
            validator: widget.validate),
        widget.divider
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_LARGE),
                child: Divider())
            : SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
