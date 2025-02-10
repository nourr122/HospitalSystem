import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/reports/presentation/views/reports_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instant_project/features/calls/doctor%20calls/presentation/views/widgets/doctor.dart';
import 'package:instant_project/features/calls/nurse%20calls/presentation/views/widgets/nurse.dart';
import 'package:instant_project/features/calls/specialist%20calls/presentation/views/widgets/specialist.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
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
        return  MaterialApp(
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
        );
      },
    );
  }
}
