import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.icon,
    this.maxLines = 1,
    this.controller,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final IconData? icon;
  final int maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          size: 15,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 14,
        ),
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.gray.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.gray.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.gray.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
    );
  }
}
