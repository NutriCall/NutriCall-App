import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomFloatingTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CustomFloatingTextField({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53, 
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(
            color: AppColor.darkGreen,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: GoogleFonts.poppins(
            color: AppColor.darkGreen,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          filled: true,
          fillColor: AppColor.darkWhite2,
        ),
        style: GoogleFonts.poppins(
          color: AppColor.semiBlack,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: AppColor.semiBlack,
      ),
    );
  }
}

