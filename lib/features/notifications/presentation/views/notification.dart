import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/core/utils/app_assets.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/model/notifaication_model.dart';
import 'CustomItemWidget.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final List<NotificationModel> notifications = [
    NotificationModel(
      userName: "Ebrahem Khaled",
      photoUrl: AppAssets.employee1,
      description: "You have new call from manger",
      time: "02:39AM",
      isNew: true,
    ),
    NotificationModel(
      userName: "Ebrahem Khaled",
      photoUrl: AppAssets.employee1,
      description: "You have new task from manger",
      time: "02:39AM",
      isNew: true,
    ),
    NotificationModel(
      userName: "Ebrahem Khaled",
      photoUrl: AppAssets.employee2,
      description: "You have Medical record from analysis employee",
      time: "02:39AM",
      isNew: false,
    ),
    NotificationModel(
      userName: "Ebrahem Khaled",
      photoUrl: AppAssets.employee3,
      description: "You have New Call from Receptionist",
      time: "02:39AM",
      isNew: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 25,
                color: AppColors.textDarkGrayColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              "Notification",
              style: GoogleFonts.poppins(fontSize: 25, color: AppColors.textDarkGrayColor, fontWeight: FontWeight.w400),/*TextStyle(
                fontSize: 25,
                color: appBarColor,
                fontWeight: FontWeight.w400,
              ),*/
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: false,
            expandedHeight: appBarHeight,
            flexibleSpace: const FlexibleSpaceBar(
              background: SizedBox(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final notification = notifications[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: CustomItemWidget(notification: notification),
                );
              },
              childCount: notifications.length,
            ),
          ),
        ],
      ),
    );
  }
}