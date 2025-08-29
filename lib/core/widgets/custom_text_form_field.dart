import 'package:flutter/material.dart';
import '../../constrains.dart';
import '../style/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.textInputType,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.autovalidateMode,
  });
  final TextInputType? textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      maxLines: maxLines,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: AppStyle.smallTextStyle.copyWith(color: kPrimaryColor),
        filled: true,
        fillColor: kNeutralColor,
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(kBorderRadius / 2)),
      borderSide: BorderSide(color: kSecondaryColor, width: 1),
    );
  }
}

