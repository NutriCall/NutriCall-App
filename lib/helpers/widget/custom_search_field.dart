import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onSearch;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.semiBlack,
      controller: controller,
      style: GoogleFonts.poppins(
        color: AppColor.darkGreen,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: AppColor.darkGreen,
          fontSize: 15,
          fontWeight: FontWeight.w500
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.darkGreen,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.darkGreen, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search, color: AppColor.darkGreen),
          onPressed: onSearch,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.darkGreen,
            width: 1.5,
          ),
        ),

      ),
      onSubmitted: (value) => onSearch(),
    );
  }
}
