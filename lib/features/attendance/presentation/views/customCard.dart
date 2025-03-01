import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';

import '../../../../core/utils/app_colors.dart';
import '../viewModel/attendanceCubit/attendance_cubit.dart';
import 'attendanceRegistered.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String time;
  final bool isDone;
  const CustomCard({super.key, required this.title, required this.time, required this.isDone});

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
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              time,
              style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: isDone? SvgPicture.asset(AppAssets.trueIcon): SvgPicture.asset(AppAssets.falseIcon),
          ),
          const SizedBox(height: 4),
          BlocConsumer<AttendanceCubit, AttendanceState>(
            listener: (context, state) {
              if (state is AttendanceSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AttendanceRegistered(),
                  ),
                );
              } else if (state is AttendanceFailure) {
                Fluttertoast.showToast(
                  msg: state.error,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  gravity: ToastGravity.BOTTOM,
                );
              }
            },
            builder: (context, state) {
              return IconButton(
                icon: state is AttendanceLoading
                    ? const CircularProgressIndicator(color: Colors.white,)
                    : SvgPicture.asset(AppAssets.greenArrow),
                onPressed: () {
                  if (state is! AttendanceLoading) {
                    context.read<AttendanceCubit>().updateAttendance(state: title.toLowerCase());
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
