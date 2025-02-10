import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/attendance/presentation/views/attendanceRegistered.dart';

class RegisterAttendance extends StatelessWidget {
  const RegisterAttendance({super.key});

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
                  IconButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AttendanceRegistered(),
                  ),
                  );}, icon: SvgPicture.asset(AppAssets.fingerprintIcon),),

                  const SizedBox(height: 40),
                  Text(
                    "Please touch ID sensor to verify registration",
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
    );
  }
}
