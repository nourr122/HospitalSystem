import 'package:flutter/material.dart';

import 'package:instant_project/core/utils/app_colors.dart';
import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return MaterialApp(
          theme: isLightTheme
              ? AppTheme.light.copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
              selectionColor: AppColors.secondColor,
              selectionHandleColor: AppColors.primaryColor,
            ),
            primaryColor: AppColors.blackColor1,
            focusColor: AppColors.blackColor1,
          )
              : AppTheme.dark.copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
              selectionColor: AppColors.secondColor,
              selectionHandleColor: AppColors.primaryColor,
            ),
            primaryColor: AppColors.blackColor1,
            focusColor: AppColors.blackColor1,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

