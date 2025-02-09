
import 'package:flutter/material.dart';
import 'package:instant_project/core/utils/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        width: MediaQuery.of(context).size.width/16,
        height: MediaQuery.of(context).size.height/34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300, 
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width/28,
            height: MediaQuery.of(context).size.height/58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade400, 
            ),
          ),
        ),
      ),
    );
  }
}
