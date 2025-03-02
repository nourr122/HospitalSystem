import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/features/attendance/presentation/viewModel/attendanceCubit/attendance_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Calls%20Cubit/get_all_calls_cubit.dart';
import 'package:instant_project/features/profile/presentation/viewModel/authenticationCubit/authentication_cubit.dart';

import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/attendance/data/attendanceRepo.dart';
import 'features/calls/doctor calls/cubits/Get All Calls Doctos Cubit/get_all_calls_doctors_cubit.dart';
import 'features/calls/nurse calls/cubits/Get All Calls Nurse/get_all_calls_nurse_cubit.dart';
import 'features/profile/data/repository/registerRepo.dart';

void main() {
  runApp(const MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthenticationCubit(AuthenticationRepository())),
            BlocProvider(create: (context) => AttendanceCubit(AttendanceRepository())),
            BlocProvider(create: (context) => GetAllCallsCubit()),
            BlocProvider(create: (context) => GetAllCallsNurseCubit()),
            BlocProvider(create: (context) => GetAllCallsDoctorsCubit()),
          ],
          child: MaterialApp(
            theme: isLightTheme
                ? AppTheme.light.copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme
                    .of(context)
                    .textTheme,
              ),
            )
                : AppTheme.dark.copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme
                    .of(context)
                    .textTheme,
              ),
            ),
            onGenerateRoute: AppRouter.onGenerateRoute,
            debugShowCheckedModeBanner: false,
            // home: Specialist(),
            //home: Doctor(),
            //home: Nurse(),
          ),

        );
      },
    );
  }
}
