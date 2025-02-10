import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/features/attendance/presentation/views/attendancePage.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_assets.dart';

class AttendanceRegistered extends StatelessWidget {
  const AttendanceRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.borderWhiteIcon),
                      Positioned.fill(
                        child: Center(
                          child: SvgPicture.asset(AppAssets.whiteTrueIcon),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Your attendance has been registered",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
                }, icon: SvgPicture.asset(AppAssets.rightArrowIcon)),
              SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  AppAssets.waveIcon,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
