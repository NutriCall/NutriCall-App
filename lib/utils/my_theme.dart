import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MyTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme:
          GoogleFonts.poppinsTextTheme().apply(bodyColor: AppColor.textColor),
      fontFamily: GoogleFonts.poppins().fontFamily,
      scaffoldBackgroundColor: AppColor.primaryColor,
    );
  }
}
