import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_colors.dart';

class CustomTileWidget extends StatelessWidget {
  final String specialist;
  final String iconPath;
  final double iconSize;

  const CustomTileWidget({
    super.key,
    required this.specialist,
    required this.iconPath,
    required this.iconSize,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        height: iconSize * 0.7,
        width: iconSize,
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          specialist,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkGrayColor,
          ),
        ),
      ),
      //dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
