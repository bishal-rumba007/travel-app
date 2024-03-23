import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/core/themes/colors.dart';


ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    onBackground: Color(0xFFF8F8F8),
    primary: AppColor.primaryColor,
    surface: Colors.white,
  ),
  splashColor: AppColor.primaryColor.withOpacity(0.25),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.rubik(
      fontSize: 42.sp,
      fontWeight: FontWeight.w900,
      color: AppColor.textColor,
    ),
    displayMedium: GoogleFonts.rubik(
      fontSize: 40.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.textColor,
    ),
    displaySmall: GoogleFonts.rubik(
      fontSize: 36.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.textColor,
    ),
    headlineLarge: GoogleFonts.rubik(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.textColor,
    ),
    headlineMedium: GoogleFonts.rubik(
      fontSize: 28.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.textColor,
    ),
    headlineSmall: GoogleFonts.rubik(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),
    titleLarge: GoogleFonts.rubik(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),
    titleMedium: GoogleFonts.rubik(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.textColor,
    ),
    titleSmall: GoogleFonts.rubik(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.textColor,
    ),
    bodyLarge: GoogleFonts.rubik(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.textColor,
    ),
    bodyMedium: GoogleFonts.rubik(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.textColor,
    ),
    bodySmall: GoogleFonts.rubik(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.textColor,
    ),
    labelLarge: GoogleFonts.rubik(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.textColor,
    ),
    labelMedium: GoogleFonts.rubik(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.textColor,
    ),
    labelSmall: GoogleFonts.rubik(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.textColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColor.primaryColor.withOpacity(0.5),
      minimumSize: Size(double.infinity, 50.h),
      textStyle: GoogleFonts.rubik(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: Colors.white,
      ),
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF8F8F8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.all(16.w),
    hintStyle: GoogleFonts.rubik(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.textColor.withOpacity(0.35),
    ),
    suffixIconColor: AppColor.iconColor.withOpacity(0.45),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: AppColor.primaryColor,
        width: 1.4.w,
      ),
    ),
  )
);