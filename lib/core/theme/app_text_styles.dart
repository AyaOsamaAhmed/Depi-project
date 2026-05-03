import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _poppins = 'Poppins';

  static TextStyle h1 = TextStyle(
    fontFamily: _poppins,
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
    height: 56 / 48,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: _poppins,
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
    height: 44 / 36,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: _poppins,
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    height: 36 / 28,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: _poppins,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    height: 32 / 24,
  );

  static TextStyle bodyL = TextStyle(
    fontFamily: _poppins,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
  );

  static TextStyle bodyM = TextStyle(
    fontFamily: _poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
  );

  static TextStyle bodyS = TextStyle(
    fontFamily: _poppins,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static TextStyle label = TextStyle(
    fontFamily: _poppins,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );

  static TextStyle smallLabel = TextStyle(
    fontFamily: _poppins,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 14 / 10,
  );

  static TextStyle buttonL = TextStyle(
    fontFamily: _poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 20 / 16,
  );

  static TextStyle buttonS = TextStyle(
    fontFamily: _poppins,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 18 / 14,
  );
}
