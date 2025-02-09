import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.widget,
      this.maxLines = 1,
      required this.validator,
      this.readOnly = false,
      this.onTap,
      required this.hintStyle,
      this.controller});
  final String hintText;
  final TextInputType keyboardType;
  final Widget? widget;
  final int? maxLines;
  final String? Function(String?) validator;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextStyle hintStyle;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      readOnly: readOnly!,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: widget,
          hintStyle: hintStyle,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  (MediaQuery.of(context).size.height) / 101),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: outlineInputBorder(height),
          enabledBorder: outlineInputBorder(height),
          errorBorder: outlineErrorBorder(height)),
    );
  }
}

OutlineInputBorder outlineInputBorder(double height) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(height / 101),
      borderSide: const BorderSide(color: Colors.grey));
}

OutlineInputBorder outlineErrorBorder(double height) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(height / 101),
      borderSide: const BorderSide(color: Colors.red));
}
