import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_router.dart';
import 'core/utils/app_themes.dart';
import 'features/reports/presentation/views/reports_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
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
    );
  }
}