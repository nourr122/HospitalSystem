import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/features/profile/data/model/user_model.dart';
import 'package:instant_project/features/profile/presentation/views/customEditWidget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import 'EditProfile.dart';
import 'customTileWidget.dart';

class MyProfile extends StatefulWidget {
  final bool isHR;
  const MyProfile({super.key, required this.isHR});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final UserModel user = UserModel(
    firstName: 'Ebrahem',
    lastName: 'Elzainy',
    specialist: 'Specialist - Doctor',
    gender: 'Male',
    statues: 'Single',
    phone: '096521145523',
    email: 'ebrahemelzainy@gmail.com',
    address: 'Mansoura, Shirben',
    dateOfBirth: '29-03-1997',
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double profileSize = screenWidth * 0.3;
    double iconSize = screenHeight * 0.05;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: AppColors.textLightGrayColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "My Profile",
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.05,
            color: AppColors.textLightGrayColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        toolbarHeight: screenHeight * 0.1,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.7,
            colors: [
              Color(0xFF2AE2D1),
              Color(0xFF17B7A8),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.15),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: profileSize / 1.5,
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.66,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x00000014).withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Text(
                                  '${user.firstName} ${user.lastName}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGreenColor,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                CustomTileWidget(specialist: user.specialist, iconPath: AppAssets.specialistIcon, iconSize: iconSize),
                                CustomTileWidget(specialist: user.gender, iconPath: AppAssets.genderIcon, iconSize: iconSize),
                                CustomTileWidget(specialist: user.dateOfBirth, iconPath: AppAssets.dateIcon, iconSize: iconSize),
                                CustomTileWidget(specialist: user.address, iconPath: AppAssets.locationIcon, iconSize: iconSize),
                                CustomTileWidget(specialist: user.statues, iconPath: AppAssets.statuesIcon, iconSize: iconSize),
                                CustomTileWidget(specialist: user.email, iconPath: AppAssets.emailIcon, iconSize: iconSize),
                                CustomTileWidget(specialist: user.phone, iconPath: AppAssets.phoneIcon, iconSize: iconSize),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: profileSize * 1.5,
                          height: profileSize * 1.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        Container(
                          width: profileSize * 1.3,
                          height: profileSize * 1.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        Container(
                          width: profileSize * 1.5,
                          height: profileSize * 1.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryColor, width: 4),
                          ),
                        ),
                        CircleAvatar(
                          radius: profileSize / 2,
                          backgroundImage: const AssetImage(AppAssets.profileImage),
                        ),
                      ],
                    ),
                  ),
                  if (widget.isHR)
                    Positioned(
                      bottom: screenHeight * 0.062,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => EditProfile(user: user),
                            ),
                          );
                        },
                        child: const CustomEditWidget(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
