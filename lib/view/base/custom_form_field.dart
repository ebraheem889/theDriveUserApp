import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_drive/controller/services/const/colors.dart';

class CustomFormField extends StatefulWidget {
  final String? hintLabel;
  final bool? _addContentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final TextInputType textInputType;
  final void Function(String?)? save;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final VoidCallback? onPress;
  final int maxlines;
  final Widget? suffixIcon;
  final Widget? label;
  final bool? _isSecure;
  final bool? readOnly;
  final TextAlign textAlign;
  final TextStyle? errorStyle;
  final String obscuringCharacter;
  const CustomFormField({
    Key? key,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.maxlines = 1,
    this.errorStyle,
    this.save,
    this.validate,
    bool? isSecure,
    this.hintLabel,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.readOnly,
    this.onPress,
    this.style,
    bool? addContentPadding,
    this.label,
    this.inputFormatters,
    this.onChanged,
    this.obscuringCharacter = '•',
  })  : _isSecure = isSecure ?? false,
        _addContentPadding = addContentPadding ?? true,
        super(key: key);
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        onTap: widget.onPress,
        maxLines: widget.maxlines,
        style: widget.style,
        cursorColor: Colors.grey,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget._isSecure!,
        validator: widget.validate,
        onSaved: widget.save,
        obscuringCharacter: widget.obscuringCharacter,
        readOnly: widget.readOnly ?? false,
        textAlign: widget.textAlign,
        decoration: InputDecoration(
          //! Remove this line if you want to show an error message.
          errorStyle: widget.errorStyle ??
              const TextStyle(overflow: TextOverflow.visible),
          errorMaxLines: 2,
          label: widget.label,
          suffixIcon: widget.suffixIcon,
          contentPadding: widget._addContentPadding!
              ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              : const EdgeInsets.symmetric(horizontal: 5),
          fillColor: greyColor.withOpacity(0.001),
          filled: true,
          focusColor: Colors.grey,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintLabel,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
