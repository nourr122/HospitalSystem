import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,  
      builder: (context, child) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Specialist(),
      //home: Doctor(),
      //home: Nurse(),

  );});
  }
}
