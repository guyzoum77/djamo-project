import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'app_colors_utils.dart';

class BuildDatePickerField extends StatelessWidget {
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final DateTime? valueUpdated;
  final void Function(DateTime?)? onChanged;

  const BuildDatePickerField({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
    this.valueUpdated,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: DateTimeFormField(
        initialValue: valueUpdated,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 12),
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
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsUtils.kPrimaryColor, width: 1.0),
          ),
          suffixIcon: const Icon(Icons.event_note, color: AppColorsUtils.kPrimaryColor,),
        ),
        mode: DateTimeFieldPickerMode.dateAndTime,
        autovalidateMode: AutovalidateMode.always,
        onChanged: onChanged,
      ),
    );
  }
}
