import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/features/attendance/presentation/viewModel/attendanceCubit/attendance_cubit.dart';
import 'package:instant_project/features/profile/presentation/viewModel/authenticationCubit/authentication_cubit.dart';

import 'package:instant_project/core/utils/app_colors.dart';
import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/attendance/data/attendanceRepo.dart';
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

