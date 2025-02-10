import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  //Regular
  static TextStyle stylePoppinsRegular12Subtitle = TextStyle(
    color: const Color(0xff777777),
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  ); 
  static TextStyle stylePoppinsRegular14Hint = TextStyle(
    color: const Color(0xff7F7F7F),
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle stylePoppinsRegular16PageTitle = TextStyle(
    color: const Color(0xff343434),
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  ); 
  
  //Mediam
  static TextStyle stylePoppinsMedium14Title = TextStyle(
    color: const Color(0xff343434),
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle stylePoppinsMedium16SuccessBody = TextStyle(
    color: const Color(0xff36F38E),
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

}