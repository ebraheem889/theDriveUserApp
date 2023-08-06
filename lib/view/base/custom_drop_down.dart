import 'dart:developer';

import 'package:flutter/material.dart';

class CustomDropDownMenu<T> extends StatefulWidget {
  final String hintText;
  final T? value;
  final void Function(T?) onChanged;
  final double height;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T?)? validate;
  final VoidCallback? onTap;
  const CustomDropDownMenu({
    Key? key,
    required this.hintText,
    required this.value,
    required this.onChanged,
    required this.items,
    this.height = 48,
    this.validate,
    this.onTap,
  }) : super(key: key);
  @override
  State<CustomDropDownMenu<T>> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState<T> extends State<CustomDropDownMenu<T>> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: widget.validate,
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              //! this approach was chosen because there is a problem with [DropdownButtonFormField] widget.
              //! the selected value is being cached somewhere and it doesn't appear to be resetted
              //! on setState() call causing an assertion exception.
              //!
              //! so we had a FormFlied in order have a validator, and we must set the value that must be validated
              //! by searching the context for a [FormFieldState] and set the value manually, and call vaildate()
              //!
              //! Please refactor this to a [DropdownButtonFormField] when the flutter team fix this issue.
              //! I left the [InputDecoration] commented out so when you refactor.
              child: GestureDetector(
                onTap: widget.onTap,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    onTap: widget.onTap,
                    hint: Text(
                      widget.hintText,
                      style: TextStyle(fontSize: 13),
                    ),
                    isExpanded: true,
                    focusColor: Colors.white,
                    value: widget.value,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      // color: AppColors.veryDarkGrey,
                    ),
                    style: const TextStyle(color: Colors.black),
                    iconEnabledColor: Colors.grey,
                    iconDisabledColor: Colors.grey,
                    onChanged: (value) {
                      widget.onChanged(value);
                      formState
                        ..didChange(value)
                        ..validate();
                    },
                    items: widget.items,
                  ),
                ),
              ),
            ),
            if (formState.hasError) const SizedBox(height: 8),
            if (formState.hasError)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  // vertical: 3,
                ),
                child: Text(
                  formState.errorText ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xffd32f2f),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textBaseline: TextBaseline.alphabetic,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
