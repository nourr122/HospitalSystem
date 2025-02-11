import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instant_project/features/Employees/presentation/views/EmployeesList.dart';
import 'package:instant_project/features/attendance/presentation/views/attendancePage.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/doctor_calls_view.dart';
import 'package:instant_project/features/calls/nurse%20calls/presentation/views/nurse_calls_view.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/specialist_calls_view.dart';
import 'package:instant_project/features/cases/presentation/views/case.dart';
import 'package:instant_project/features/home/data/model/homeItemModel.dart';
import 'package:instant_project/features/home/presentation/views/customFullContainer.dart';
import 'package:instant_project/features/reports/presentation/views/reports_screen.dart';
import 'package:instant_project/features/tasks/presentation/screens/tasks_screen.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../notifications/presentation/views/notification.dart';
import '../../../profile/presentation/views/Myprofile.dart';
import 'customContainer.dart';

Map<String, Map<String, dynamic>> roleBasedContent(String role) => {
      "HR": {
        'name': 'Ebrahem Elzainy',
        'profile': AppAssets.hrProfile,
        'items': [
          HomeItemModel(
              title: 'Cases',
              iconUrl: AppAssets.casesIcon,
              containerColor: const Color.fromRGBO(95, 158, 220, 1),
              onTap: (BuildContext context) {
                return Case(
                  title: 'Cases',
                  role:role,
                );
              }),
          HomeItemModel(
              title: 'Tasks',
              iconUrl: AppAssets.tasksIcon,
              containerColor: const Color.fromRGBO(95, 220, 137, 1),
              onTap: (BuildContext context) {
                return const TasksScreen();
              }),
          HomeItemModel(
              title: 'Reports',
              iconUrl: AppAssets.reportsIcon,
              containerColor: const Color.fromRGBO(145, 95, 220, 1),
              onTap: (BuildContext context) {
                return const ReportsScreen();
              }),
          HomeItemModel(
              title: 'Attendance - Leaving',
              iconUrl: AppAssets.attendanceIcon,
              containerColor: const Color.fromRGBO(95, 220, 220, 1),
              onTap: (BuildContext context) {
                return const AttendancePage();
              }),
          HomeItemModel(
              title: 'Employee',
              iconUrl: AppAssets.employeesIcon,
              containerColor: const Color.fromRGBO(220, 145, 95, 1),
              onTap: (BuildContext context) {
                return EmployeesList();
              }),
        ],
      },
      "Receptionist": {
        'name': 'Ebrahem Elzainy',
        'profile': AppAssets.receptionistProfile,
        'items': [
          HomeItemModel(
              title: 'Calls',
              iconUrl: AppAssets.callsIcon,
              containerColor: const Color.fromRGBO(95, 158, 220, 1),
              onTap: (BuildContext context) {
                return const SpecialistCallsView();
              }),
          HomeItemModel(
              title: 'Tasks',
              iconUrl: AppAssets.tasksIcon,
              containerColor: const Color.fromRGBO(95, 220, 137, 1),
              onTap: (BuildContext context) {
                return const TasksScreen();
              }),
          HomeItemModel(
              title: 'Reports',
              iconUrl: AppAssets.reportsIcon,
              containerColor: const Color.fromRGBO(145, 95, 220, 1),
              onTap: (BuildContext context) {
                return const ReportsScreen();
              }),
          HomeItemModel(
            title: 'Attendance - Leaving',
            iconUrl: AppAssets.attendanceIcon,
            containerColor: const Color.fromRGBO(95, 220, 220, 1),
            onTap: (BuildContext context) {
              return const AttendancePage();
            },
          ),
        ],
      },
      "Manager": {
        'name': 'Mohamed Ahmed',
        'profile': AppAssets.mangerProfile,
        'items': [
          HomeItemModel(
              title: 'Employee',
              iconUrl: AppAssets.employeesIcon,
              containerColor: const Color.fromRGBO(220, 145, 95, 1),
              onTap: (BuildContext context) {
                return EmployeesList();
              }),
          HomeItemModel(
              title: 'Tasks',
              iconUrl: AppAssets.tasksIcon,
              containerColor: const Color.fromRGBO(95, 220, 137, 1),
              onTap: (BuildContext context) {
                return const TasksScreen();
              }),
          HomeItemModel(
              title: 'Reports',
              iconUrl: AppAssets.reportsIcon,
              containerColor: const Color.fromRGBO(145, 95, 220, 1),
              onTap: (BuildContext context) {
                return const ReportsScreen();
              }),
          HomeItemModel(
              title: 'Attendance - Leaving',
              iconUrl: AppAssets.attendanceIcon,
              containerColor: const Color.fromRGBO(95, 220, 220, 1),
              onTap: (BuildContext context) {
                return const AttendancePage();
              }),
        ],
      },
      "Doctor": {
        'name': 'Mahmoud Ahmed',
        'profile': AppAssets.doctorProfile,
        'items': [
          HomeItemModel(
              title: 'Calls',
              description: 'You have new +1 Request',
              iconUrl: AppAssets.callsIcon,
              containerColor: const Color.fromRGBO(95, 158, 220, 1),
              onTap: (BuildContext context) {
                return const DoctorCallsView();
              }),
          HomeItemModel(
              title: 'Tasks',
              description: 'You have new +1 task',
              iconUrl: AppAssets.tasksIcon,
              containerColor: const Color.fromRGBO(95, 220, 137, 1),
              onTap: (BuildContext context) {
                return const TasksScreen();
              }),
          HomeItemModel(
              title: 'Reports',
              description: 'You have new +3 Reports',
              iconUrl: AppAssets.reportsIcon,
              containerColor: const Color.fromRGBO(145, 95, 220, 1),
              onTap: (BuildContext context) {
                return const ReportsScreen();
              }),
          HomeItemModel(
              title: 'Attendance - Leaving',
              iconUrl: AppAssets.attendanceIcon,
              containerColor: const Color.fromRGBO(95, 220, 220, 1),
              onTap: (BuildContext context) {
                return const AttendancePage();
              }),
          HomeItemModel(
              title: 'Cases',
              iconUrl: AppAssets.casesIcon,
              containerColor: const Color.fromRGBO(220, 145, 95, 1),
              onTap: (BuildContext context) {
                return Case(
                  title: 'Cases',
                  role: role,
                );
              }),
        ],
      },
      "Nurse": {
        'name': 'Salma Ali',
        'profile': AppAssets.nurseProfile,
        'items': [
          HomeItemModel(
              title: 'Calls',
              iconUrl: AppAssets.callsIcon,
              containerColor: const Color.fromRGBO(95, 158, 220, 1),
              onTap: (BuildContext context) {
                return const NurseCallsView();
              }),
          HomeItemModel(
              title: 'Tasks',
              iconUrl: AppAssets.tasksIcon,
              containerColor: const Color.fromRGBO(95, 220, 137, 1),
              onTap: (BuildContext context) {
                return const TasksScreen();
              }),
          HomeItemModel(
              title: 'Reports',
              iconUrl: AppAssets.reportsIcon,
              containerColor: const Color.fromRGBO(145, 95, 220, 1),
              onTap: (BuildContext context) {
                return const ReportsScreen();
              }),
          HomeItemModel(
              title: 'Attendance - Leaving',
              iconUrl: AppAssets.attendanceIcon,
              containerColor: const Color.fromRGBO(95, 220, 220, 1),
              onTap: (BuildContext context) {
                return const AttendancePage();
              }),
          HomeItemModel(
            title: 'Cases',
            iconUrl: AppAssets.casesIcon,
            containerColor: const Color.fromRGBO(220, 145, 95, 1),
            onTap: (BuildContext context) {
              return Case(
                title: 'Cases',
                role :role,
              );
            },
          ),
        ],
      },
      "Analysis Employee": {
        'name': 'Fayez Bahgt',
        'profile': AppAssets.analysisEmployeeProfile,
        'items': [
          HomeItemModel(
              title: 'Cases',
              iconUrl: AppAssets.casesIcon,
              containerColor: const Color.fromRGBO(95, 158, 220, 1),
              onTap: (BuildContext context) {
                return Case(
                  title: 'Cases',
                  role: role,
                );
              }),
          HomeItemModel(
              title: 'Tasks',
              iconUrl: AppAssets.tasksIcon,
              containerColor: const Color.fromRGBO(95, 220, 137, 1),
              onTap: (BuildContext context) {
                return const TasksScreen();
              }),
          HomeItemModel(
              title: 'Reports',
              iconUrl: AppAssets.reportsIcon,
              containerColor: const Color.fromRGBO(145, 95, 220, 1),
              onTap: (BuildContext context) {
                return const ReportsScreen();
              }),
          HomeItemModel(
              title: 'Attendance - Leaving',
              iconUrl: AppAssets.attendanceIcon,
              containerColor: const Color.fromRGBO(95, 220, 220, 1),
              onTap: (BuildContext context) {
                return const AttendancePage();
              }),
        ],
      }
    };

class HomeDynamicScreen extends StatelessWidget {
  final String userRole;
  const HomeDynamicScreen({super.key, required this.userRole});

  void _navigationTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.09;
    final roleData = roleBasedContent(userRole)[userRole];
    String userName = roleData?['name'];
    String profile = roleData?['profile'];
    List<HomeItemModel> items = roleData?['items'];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                    profile,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const MyProfile(isHR: false),
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
              child: SizedBox(height: 25),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              for (int i = 0; i < 2; i++)
                                GestureDetector(
                                  onTap: () => _navigationTo(
                                      context, items[i].onTap(context)),
                                  child: CustomContainer(
                                      item: items[i],
                                      height: i == 0 ? 220 : 180),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              for (int i = 2; i < 4; i++)
                                GestureDetector(
                                  onTap: () => _navigationTo(
                                      context, items[i].onTap(context)),
                                  child: CustomContainer(
                                      item: items[i],
                                      height: i == 2 ? 180 : 220),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (items.length == 5)
                    GestureDetector(
                      onTap: () =>
                          _navigationTo(context, items[4].onTap(context)),
                      child: CustomFullContainer(item: items[4]),
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
