import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.disabled = false,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.blueColor,
    this.icon,
    this.secondry = false,
    this.prefixIcon,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool disabled;
  final Color? buttonColor;
  final Color? textColor;
  final String? icon;
  final bool secondry;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          disabled ? AppColors.grayColor1.withValues(alpha: 0.3) : buttonColor,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: disabled
                  ? AppColors.grayColor1
                  : secondry
                      ? AppColors.primaryColor
                      : buttonColor!,
              width: 1,
            ),
          ),
        ),
        elevation: const WidgetStatePropertyAll(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: prefixIcon!,
            ),
          Text(
            text,
            style: TextStyle(
              color: disabled ? AppColors.grayColor1 : textColor,
              fontSize: 14,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Image.asset(
              icon!,
              width: 24,
              height: 24,
            ),
          ],
        ],
      ),
    );
  }
}
