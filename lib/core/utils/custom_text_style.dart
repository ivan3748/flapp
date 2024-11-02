import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/utils/my_colors.dart';

class CustomTextStyles {
  static TextStyle text16Black = GoogleFonts.merriweather(
    fontSize: 24.sp,
    color: MyColors.secondary,
  );
  static TextStyle text20Black = GoogleFonts.merriweather(
    fontSize: 20.sp,
    color: MyColors.secondary,
  );
  static TextStyle subtitle14dark = GoogleFonts.merriweather(
    fontSize: 14.sp,
    color: MyColors.black,
  );

  static TextStyle subtitle12gery = GoogleFonts.merriweather(
    fontSize: 12.sp,
    color: MyColors.gery,
  );

  static TextStyle font28SemiBoldWith = GoogleFonts.poppins(
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
  );
  static TextStyle font18SemiBoldWith = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font18secondary = GoogleFonts.poppins(
    fontSize: 18.sp,
    color: MyColors.secondary,
  );

  static TextStyle font14Dark = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: Colors.black,
  );
  static TextStyle font14Blue = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: Colors.blue,
  );
}
