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
  final String userRole;
  //final int id;
  const HomeDynamicScreen({super.key, required this.userRole});

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
    context.read<AuthenticationCubit>().fetchUserProfile(99);// widget.id or shared pref
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AuthenticationCubit>().fetchUserProfile(99);// widget.id or shared pref
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                  );
                } else if (state is ProfileFailure) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "Error: ${state.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else if (state is ProfileSuccess) {
                  String userName = "${state.user.firstName} ${state.user.lastName}";
                  String profile = state.user.gender == 'Female' ? AppAssets.femaleIcon : AppAssets.maleIcon;
                  String userRole = state.user.specialist;

                  return SliverAppBar(
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
                          MaterialPageRoute(builder: (context) => UserProfile(user: state.user,)),
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
                    /*actions: [
                      IconButton(
                        icon: SvgPicture.asset(AppAssets.notificationIcon),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotificationPage()),
                          );
                        },
                      ),
                    ],*/
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    pinned: true,
                    expandedHeight: appBarHeight,
                    flexibleSpace: const FlexibleSpaceBar(background: SizedBox()),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 25)),

            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                  );
                } else if (state is ProfileFailure) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text("Failed to load home")),
                  );
                } else if (state is ProfileSuccess) {
                  String userRole = state.user.type.name;
                  List<HomeItemModel> items =[];
                  final roleData = roleBasedContent(userRole)[userRole];
                  if (roleData != null) {
                    items = roleData['items'] ?? [];
                  } else {
                    items = [];
                  }


                  return SliverList(
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
                                          onTap: () => _navigationTo(context, items[i].onTap,state.user),
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
                                          onTap: () => _navigationTo(context, items[i].onTap,state.user),
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
                            onTap: () => _navigationTo(context, items[4].onTap,state.user),
                            child: CustomFullContainer(item: items[4]),
                          ),
                      ],
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}
