import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_colors.dart';
import 'package:instant_project/core/utils/app_assets.dart';
import 'package:instant_project/features/notifications/data/model/notifaication_model.dart';

class CustomItemWidget extends StatelessWidget {
  final NotificationModel notification;

  const CustomItemWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth > 600 ? 17 : 15;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.028,
        horizontal: screenWidth * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 0.1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0000001a).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              notification.photoUrl,
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.userName,
                  style: GoogleFonts.poppins(fontSize: fontSize, color: AppColors.darkGray, fontWeight: FontWeight.w400),
                  /*TextStyle(
                    fontSize: fontSize,
                    color: darkGray,
                    fontWeight: FontWeight.w400,
                  ),*/
                ),
                const SizedBox(height: 4.0),
                Text(
                  notification.description,
                  style: GoogleFonts.poppins(fontSize: screenWidth > 600 ? 16 : 14, color: AppColors.lightGray),
                  /*TextStyle(
                    fontSize: screenWidth > 600 ? 16 : 14,
                    color: lightGray,
                  ),*/
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          Text(
            notification.time,
            style: GoogleFonts.poppins(fontSize: screenWidth > 600 ? 12 : 11, color: const Color(0xffB5B5B5)),
            /*TextStyle(
              fontSize: screenWidth > 600 ? 12 : 11,
              color: const Color(0xffB5B5B5),
            ),*/
          ),
          if (notification.isNew)
            const SizedBox(width: 6.0),
          if (notification.isNew)
            SvgPicture.asset(
              AppAssets.newNotification,
              width: screenWidth * 0.028,
              height: screenWidth * 0.028,
            ),
        ],
      ),
    );
  }
}