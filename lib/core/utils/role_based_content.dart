import 'package:flutter/material.dart';

import '../../features/Employees/presentation/views/EmployeesList.dart';
import '../../features/attendance/presentation/views/attendancePage.dart';
import '../../features/calls/doctor calls/presentation/views/doctor_calls_view.dart';
import '../../features/calls/nurse calls/presentation/views/nurse_calls_view.dart';
import '../../features/calls/specialist calls/presentation/views/specialist_calls_view.dart';
import '../../features/cases/presentation/views/case.dart';
import '../../features/home/data/model/homeItemModel.dart';
import '../../features/reports/presentation/views/reports_screen.dart';
import '../../features/tasks/presentation/screens/tasks_screen.dart';
import 'app_assets.dart';

Map<String, Map<String, List<HomeItemModel>>> roleBasedContent(String role) => {
  "hr": {
    'items': [
      HomeItemModel(
          title: 'Employee',
          iconUrl: AppAssets.employeesIcon,
          containerColor: const Color.fromRGBO(220, 145, 95, 1),
          onTap: (BuildContext context,user) {
            return const EmployeesList();
          }),
      HomeItemModel(
          title: 'Tasks',
          iconUrl: AppAssets.tasksIcon,
          containerColor: const Color.fromRGBO(95, 220, 137, 1),
          onTap: (BuildContext context,user) {
            return const TasksScreen();
          }),
      HomeItemModel(
          title: 'Reports',
          iconUrl: AppAssets.reportsIcon,
          containerColor: const Color.fromRGBO(145, 95, 220, 1),
          onTap: (BuildContext context,user) {
            return const ReportsScreen();
          }),
      HomeItemModel(
          title: 'Attendance - Leaving',
          iconUrl: AppAssets.attendanceIcon,
          containerColor: const Color.fromRGBO(95, 220, 220, 1),
          onTap: (BuildContext context,user) {
            return AttendancePage(user: user,);
          }),
    ],
  },
  "receptionist": {
    'items': [
      HomeItemModel(
          title: 'Calls',
          iconUrl: AppAssets.callsIcon,
          containerColor: const Color.fromRGBO(95, 158, 220, 1),
          onTap: (BuildContext context,user) {
            return const SpecialistCallsView();
          }),
      HomeItemModel(
          title: 'Tasks',
          iconUrl: AppAssets.tasksIcon,
          containerColor: const Color.fromRGBO(95, 220, 137, 1),
          onTap: (BuildContext context,user) {
            return const TasksScreen();
          }),
      HomeItemModel(
          title: 'Reports',
          iconUrl: AppAssets.reportsIcon,
          containerColor: const Color.fromRGBO(145, 95, 220, 1),
          onTap: (BuildContext context,user) {
            return const ReportsScreen();
          }),
      HomeItemModel(
        title: 'Attendance - Leaving',
        iconUrl: AppAssets.attendanceIcon,
        containerColor: const Color.fromRGBO(95, 220, 220, 1),
        onTap: (BuildContext context,user) {
          return AttendancePage(user: user,);
        },
      ),
    ],
  },
  "manager": {
    'items': [
      HomeItemModel(
          title: 'Cases',
          iconUrl: AppAssets.casesIcon,
          containerColor: const Color.fromRGBO(95, 158, 220, 1),
          onTap: (BuildContext context,user) {
            return Case(
              title: 'Cases',
              role:role,
            );
          }),
      HomeItemModel(
          title: 'Tasks',
          iconUrl: AppAssets.tasksIcon,
          containerColor: const Color.fromRGBO(95, 220, 137, 1),
          onTap: (BuildContext context,user) {
            return const TasksScreen();
          }),
      HomeItemModel(
          title: 'Reports',
          iconUrl: AppAssets.reportsIcon,
          containerColor: const Color.fromRGBO(145, 95, 220, 1),
          onTap: (BuildContext context,user) {
            return const ReportsScreen();
          }),
      HomeItemModel(
          title: 'Attendance - Leaving',
          iconUrl: AppAssets.attendanceIcon,
          containerColor: const Color.fromRGBO(95, 220, 220, 1),
          onTap: (BuildContext context,user) {
            return AttendancePage(user: user,);
          }),
      HomeItemModel(
          title: 'Employee',
          iconUrl: AppAssets.employeesIcon,
          containerColor: const Color.fromRGBO(220, 145, 95, 1),
          onTap: (BuildContext context,user) {
            return const EmployeesList();
          }),
    ],
  },
  "doctor": {
    'items': [
      HomeItemModel(
          title: 'Calls',
          description: 'You have new +1 Request',
          iconUrl: AppAssets.callsIcon,
          containerColor: const Color.fromRGBO(95, 158, 220, 1),
          onTap: (BuildContext context,user) {
            return const DoctorCallsView();
          }),
      HomeItemModel(
          title: 'Tasks',
          description: 'You have new +1 task',
          iconUrl: AppAssets.tasksIcon,
          containerColor: const Color.fromRGBO(95, 220, 137, 1),
          onTap: (BuildContext context,user) {
            return const TasksScreen();
          }),
      HomeItemModel(
          title: 'Reports',
          description: 'You have new +3 Reports',
          iconUrl: AppAssets.reportsIcon,
          containerColor: const Color.fromRGBO(145, 95, 220, 1),
          onTap: (BuildContext context,user) {
            return const ReportsScreen();
          }),
      HomeItemModel(
          title: 'Attendance - Leaving',
          iconUrl: AppAssets.attendanceIcon,
          containerColor: const Color.fromRGBO(95, 220, 220, 1),
          onTap: (BuildContext context,user) {
            return AttendancePage(user: user,);
          }),
      HomeItemModel(
          title: 'Cases',
          iconUrl: AppAssets.casesIcon,
          containerColor: const Color.fromRGBO(220, 145, 95, 1),
          onTap: (BuildContext context,user) {
            return Case(
              title: 'Cases',
              role: role,
            );
          }),
    ],
  },
  "nurse": {
    'items': [
      HomeItemModel(
          title: 'Calls',
          iconUrl: AppAssets.callsIcon,
          containerColor: const Color.fromRGBO(95, 158, 220, 1),
          onTap: (BuildContext context,user) {
            return const NurseCallsView();
          }),
      HomeItemModel(
          title: 'Tasks',
          iconUrl: AppAssets.tasksIcon,
          containerColor: const Color.fromRGBO(95, 220, 137, 1),
          onTap: (BuildContext context,user) {
            return const TasksScreen();
          }),
      HomeItemModel(
          title: 'Reports',
          iconUrl: AppAssets.reportsIcon,
          containerColor: const Color.fromRGBO(145, 95, 220, 1),
          onTap: (BuildContext context,user) {
            return const ReportsScreen();
          }),
      HomeItemModel(
          title: 'Attendance - Leaving',
          iconUrl: AppAssets.attendanceIcon,
          containerColor: const Color.fromRGBO(95, 220, 220, 1),
          onTap: (BuildContext context,user) {
            return AttendancePage(user: user,);
          }),
      HomeItemModel(
        title: 'Cases',
        iconUrl: AppAssets.casesIcon,
        containerColor: const Color.fromRGBO(220, 145, 95, 1),
        onTap: (BuildContext context,user) {
          return Case(
            title: 'Cases',
            role :role,
          );
        },
      ),
    ],
  },
  "analysis": {
    'items': [
      HomeItemModel(
          title: 'Cases',
          iconUrl: AppAssets.casesIcon,
          containerColor: const Color.fromRGBO(95, 158, 220, 1),
          onTap: (BuildContext context,user) {
            return Case(
              title: 'Cases',
              role: role,
            );
          }),
      HomeItemModel(
          title: 'Tasks',
          iconUrl: AppAssets.tasksIcon,
          containerColor: const Color.fromRGBO(95, 220, 137, 1),
          onTap: (BuildContext context,user) {
            return const TasksScreen();
          }),
      HomeItemModel(
          title: 'Reports',
          iconUrl: AppAssets.reportsIcon,
          containerColor: const Color.fromRGBO(145, 95, 220, 1),
          onTap: (BuildContext context,user) {
            return const ReportsScreen();
          }),
      HomeItemModel(
          title: 'Attendance - Leaving',
          iconUrl: AppAssets.attendanceIcon,
          containerColor: const Color.fromRGBO(95, 220, 220, 1),
          onTap: (BuildContext context,user) {
            return AttendancePage(user: user,);
          }),
    ],
  }
};