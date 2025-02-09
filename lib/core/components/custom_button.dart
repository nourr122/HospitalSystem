import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.buttonBody,
      required this.width,
      required this.color});
  final void Function()? onPressed;
  final Widget buttonBody;
  final double width;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 16,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(
                  (MediaQuery.of(context).size.height) / 161),
            ),
          ),
          onPressed: onPressed,
          child: buttonBody),
    );
  }
}
