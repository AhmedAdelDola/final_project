import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle poppins30black500 = TextStyle(
    fontSize: 30.sp,
    color: const Color(0xff000000),
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle poppins16black400 = TextStyle(
    fontSize: 16.sp,
    color: const Color(0xff000000),
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle style20weight600 = TextStyle(
    fontSize: 20.sp,
    color: const Color(0xFFFFFFFF),
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.radioCanada().fontFamily,
  );
  static TextStyle style32black600 = TextStyle(
    fontSize: 32.sp,
    color: const Color(0xFF131313),
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.radioCanada().fontFamily,
  );
  static TextStyle style14gray400 = TextStyle(
    fontSize: 14.sp,
    color: const Color.fromRGBO(76, 76, 76, 0.78),
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.radioCanada().fontFamily,
  );
  static TextStyle style18black500 = TextStyle(
    fontSize: 18.sp,
    color: const Color(0xFF212121),
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.radioCanada().fontFamily,
  );
  static TextStyle style14gray500 = TextStyle(
    fontSize: 14.sp,
    color: const Color.fromRGBO(113, 113, 113, 1),
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.radioCanada().fontFamily,
  );
  static TextStyle style14grays500 = TextStyle(
    fontSize: 14.sp,
    color: const Color.fromRGBO(76, 76, 76, 0.85),
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.radioCanada().fontFamily,
  );
  static TextStyle poppins24blue700 = TextStyle(
    fontSize: 24.sp,
    color: const Color(0xff407CE2),
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
