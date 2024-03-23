import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.controller,
    this.validator,
    this.labelText = '',
    this.hintText = '',
    this.textInputType,
    this.textInputAction,
    this.suffixIconWidget,
    this.maxLine,
    this.autoFocus = false,
    this.isEnabled = true,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Widget? suffixIconWidget;
  final int? maxLine;
  final bool autoFocus;
  final bool isEnabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      autofocus: autoFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      validator: validator,
      maxLines: maxLine,
      obscureText: false,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIconWidget,
      ),
      onChanged: onChanged,
    );
  }
}