import 'package:flutter/material.dart';

class CustomContainerBlue extends StatelessWidget {
  const CustomContainerBlue({super.key, required this.color, required this.containerBody,});
  final Color color;
  final Widget containerBody;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height)/4,
      width: (MediaQuery.of(context).size.width)/2.24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular((MediaQuery.of(context).size.height)/54)
      ),
      child: containerBody,
    );
  }
}