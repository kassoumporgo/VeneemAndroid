import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {

  final String title;
  final String hint;
  final double paddingBottom;
  final TextEditingController controller;
  final TextFieldType textFieldType;
  final String errorThisFieldRequired;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const CustomTextField({
    required this.title,
    required this.paddingBottom,
    required this.hint,
    required this.controller,
    required this.textFieldType,
    required this.errorThisFieldRequired,
    this.focus,
    this.nextFocus,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.textCapitalization,
    this.keyboardType,
    this.textInputAction,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          )
        ),
        5.height,
        AppTextField(
          textStyle: const TextStyle(
            fontSize: 17,
          ),
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          focus: focus,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          nextFocus: nextFocus,
          controller: controller,
          textFieldType: textFieldType,
          inputFormatters: inputFormatters,
          cursorColor: mainColor,
          decoration: appTextFieldInputDeco(hint: hint),
          errorThisFieldRequired: errorThisFieldRequired,
        ),

      ],
    ).paddingBottom(20.0);
  }

}



appTextFieldInputDeco({String? hint, Widget? icon}) {
  return InputDecoration(
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15.0),
    hintText: hint,
    hintStyle: primaryTextStyle(
        size: 17,
        color: Colors.grey.withOpacity(.7)
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.3),
        borderRadius: BorderRadius.circular(0.0)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(0.0)
    ),

    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(0.0)
    ),

    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: mainColor),
        borderRadius: BorderRadius.circular(0.0)
    ),

    icon: icon,
  );
}