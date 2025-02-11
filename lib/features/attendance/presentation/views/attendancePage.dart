import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/notifications/presentation/views/notification.dart';
import 'package:instant_project/features/profile/presentation/views/Myprofile.dart';

import '../../../../core/utils/app_colors.dart';
import 'customCard.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverAppBar(
              leading: IconButton(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppAssets.receptionistProfile,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const MyProfile(isHR: false),
                    ),
                  );
                },
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ebrahem Elzainy",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Specialist, Doctor",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: SvgPicture.asset(AppAssets.notificationIcon),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => NotificationPage(),
                      ),
                    );
                  },
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              expandedHeight: appBarHeight,
              flexibleSpace: const FlexibleSpaceBar(
                background: SizedBox(),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),

            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0x28F36D13),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Note',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffF36D13),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    "Details note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),

            const SliverToBoxAdapter(
              child: CustomCard(title: "Attendance",time: "09:00am",isDone:true),
            ),
            const SliverToBoxAdapter(
              child: CustomCard(title: "Leaving",time: "04:00pm",isDone: false),
            ),
          ],
        ),
      ),
    );
  }
}
