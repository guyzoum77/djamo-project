import 'package:flutter/material.dart';

import 'app_colors_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.initialValue,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 1, bottom: 5),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColorsUtils.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColorsUtils.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsUtils.kPrimaryColor, width: 1.0),
          ),
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12),
        ),
        initialValue: initialValue,
        validator: validator,
        controller: controller,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}


class CustomTextFormFieldFieldWithValidator extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CustomTextFormFieldFieldWithValidator({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 1, bottom: 5),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColorsUtils.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColorsUtils.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsUtils.kPrimaryColor, width: 1.0),
          ),
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12),
        ),
        validator: validator,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomTextFormFieldFieldUnderlineWithValidator extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CustomTextFormFieldFieldUnderlineWithValidator({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 1, bottom: 0, top: 0),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.all(0.0),
          isDense: true,
        ),
        readOnly: true,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomDatePickerTextFormField extends StatefulWidget {
  final TextEditingController dateCtrl;
  final bool readOnly;
  final Function() onTap;

  const CustomDatePickerTextFormField(
      {Key? key,
      required this.dateCtrl,
      required this.readOnly,
      required this.onTap})
      : super(key: key);

  @override
  State<CustomDatePickerTextFormField> createState() =>
      _CustomDatePickerTextFormFieldState();
}

class _CustomDatePickerTextFormFieldState extends State<CustomDatePickerTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColorsUtils.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColorsUtils.kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsUtils.kPrimaryColor, width: 1.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12),
          icon: const Icon(Icons.calendar_month_outlined, color: AppColorsUtils.kPrimaryColor)),
      controller: widget.dateCtrl,
      onTap: widget.onTap,
    );
  }
}
