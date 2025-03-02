import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:instant_project/features/home/data/model/homeItemModel.dart';
import 'package:instant_project/features/home/presentation/views/customFullContainer.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/role_based_content.dart';
import '../../../profile/data/model/user_model.dart';
import '../../../profile/presentation/viewModel/authenticationCubit/authentication_cubit.dart';
import '../../../profile/presentation/views/Myprofile.dart';
import 'customContainer.dart';

class HomeDynamicScreen extends StatefulWidget {
  //final String userRole;
  final int id;
  const HomeDynamicScreen({super.key, required this.id});

  @override
  State<HomeDynamicScreen> createState() => _HomeDynamicScreenState();
}

class _HomeDynamicScreenState extends State<HomeDynamicScreen> {
  void _navigationTo(BuildContext context, Widget Function(BuildContext, UserModel) screen, UserModel user) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen(context, user),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    print("Calling fetchUserProfile from HomeDynamicScreen with id: ${widget.id}");
    context.read<AuthenticationCubit>().fetchUserProfile(widget.id);
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AuthenticationCubit>().fetchUserProfile(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is ProfileFailure) {
              return Center(
                child: Text(
                  "Error: ${state.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is ProfileSuccess) {
              // Extract user once for reuse
              final user = state.user;
              final String userName = "${user.firstName} ${user.lastName}";
              final String profile = user.gender == 'Female' ? AppAssets.femaleIcon : AppAssets.maleIcon;
              final String userRole = user.specialist;

              final String userType = user.type.name;

              List<HomeItemModel> items = [];
              final roleData = roleBasedContent(userType)[userType];
              if (roleData != null) {
                items = roleData['items'] ?? [];
              }

              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  // SliverAppBar for profile section
                  SliverAppBar(
                    leading: IconButton(
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          profile,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfile(id: user.id!),
                          ),
                        );
                      },
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Specialist, $userRole",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    pinned: true,
                    expandedHeight: appBarHeight,
                    flexibleSpace: const FlexibleSpaceBar(background: SizedBox()),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 25)),

                  // Content Section
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        if (items.isNotEmpty)
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < 2 && i < items.length; i++)
                                        GestureDetector(
                                          onTap: () => _navigationTo(context, items[i].onTap, user),
                                          child: CustomContainer(item: items[i], height: i == 0 ? 220 : 180),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      for (int i = 2; i < 4 && i < items.length; i++)
                                        GestureDetector(
                                          onTap: () => _navigationTo(context, items[i].onTap, user),
                                          child: CustomContainer(item: items[i], height: i == 2 ? 180 : 220),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (items.length == 5)
                          GestureDetector(
                            onTap: () => _navigationTo(context, items[4].onTap, user),
                            child: CustomFullContainer(item: items[4]),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // Default empty state (optional)
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}