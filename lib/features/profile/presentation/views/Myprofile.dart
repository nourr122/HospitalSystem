import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/features/profile/data/model/user_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_assets.dart';
import '../viewModel/authenticationCubit/authentication_cubit.dart';
import 'customTileWidget.dart';

class UserProfile extends StatefulWidget {
  final int id;
  const UserProfile({super.key, required this.id});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  @override
  void initState() {
    super.initState();
    context.read<AuthenticationCubit>().fetchUserProfile(widget.id);
  }
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
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
          } else if (state is ProfileFailure) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is ProfileSuccess) {
            UserModel user = state.user;

            return Container(
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
                                      CustomTileWidget(specialist: user.birthday, iconPath: AppAssets.dateIcon, iconSize: iconSize),
                                      CustomTileWidget(specialist: user.address, iconPath: AppAssets.locationIcon, iconSize: iconSize),
                                      CustomTileWidget(specialist: user.status, iconPath: AppAssets.statuesIcon, iconSize: iconSize),
                                      CustomTileWidget(specialist: user.email, iconPath: AppAssets.emailIcon, iconSize: iconSize),
                                      CustomTileWidget(specialist: user.mobile, iconPath: AppAssets.phoneIcon, iconSize: iconSize),
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
                                backgroundImage: user.gender == 'Female'
                                    ? const AssetImage(AppAssets.femaleIcon)
                                    : const AssetImage(AppAssets.maleIcon),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            // This should not happen, but just in case
            return const Center(child: Text("Unexpected state"));
          }
        },
      ),
    );
  }
}