import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Get%20All%20Calls%20Doctos%20Cubit/get_all_calls_doctors_cubit.dart';
import 'package:instant_project/features/calls/doctor%20calls/cubits/Show%20Call%20Details/show_call_details_cubit.dart';
import 'package:instant_project/features/calls/nurse%20calls/cubits/Get%20All%20Calls%20Nurse/get_all_calls_nurse_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Calls%20Cubit/get_all_calls_cubit.dart';
import 'package:instant_project/features/calls/specialist%20calls/cubits/Get%20All%20Doctors%20Cubit/get_all_doctors_cubit.dart';

import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const MyApp(),
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
            BlocProvider<GetAllCallsCubit>(
              create: (BuildContext context) => GetAllCallsCubit(),
            ),
            BlocProvider<GetAllCallsDoctorsCubit>(
              create: (BuildContext context) => GetAllCallsDoctorsCubit()..getAllCalls(),
            ),
            BlocProvider<GetAllCallsNurseCubit>(
              create: (BuildContext context) => GetAllCallsNurseCubit()..getAllCalls(),
            ),
            BlocProvider<GetAllDoctorsCubit>(
              create: (BuildContext context) => GetAllDoctorsCubit()..getAllDoctors(),
            ),
          ],
          child: MaterialApp(
            theme: isLightTheme
                ? AppTheme.light.copyWith(
                    textTheme: GoogleFonts.poppinsTextTheme(
                      Theme.of(context).textTheme,
                    ),
                  )
                : AppTheme.dark.copyWith(
                    textTheme: GoogleFonts.poppinsTextTheme(
                      Theme.of(context).textTheme,
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
