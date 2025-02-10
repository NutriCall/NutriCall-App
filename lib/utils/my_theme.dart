import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme().apply(bodyColor: AppColor.textColor),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      scaffoldBackgroundColor: AppColor.primaryColor,
    );
  }
}
