import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final List<Color> colors;

  const GradientContainer({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
    );
  }
}
