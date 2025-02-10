import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/attendance/presentation/views/registerAttendance.dart';

import '../../../../core/utils/app_colors.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String time;
  final bool isDone;
  const CustomCard({super.key, required this.title, required this.time, required this.isDone});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 120,
            spreadRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              widget.time,
              style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: widget.isDone? SvgPicture.asset(AppAssets.trueIcon): SvgPicture.asset(AppAssets.falseIcon),
          ),
          const SizedBox(height: 4),
          IconButton(
            icon: SvgPicture.asset(AppAssets.greenArrow),
            onPressed: (){Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) => const RegisterAttendance(),
            ),
            );},
          ),
        ],
      ),
    );
  }
}
