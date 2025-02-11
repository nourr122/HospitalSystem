
import 'package:flutter/material.dart';

import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return MaterialApp(
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
