import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomDescriptionInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextStyle? hintStyle;

  const CustomDescriptionInput({
    super.key,
    required this.label,
    required this.placeholder,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColor.semiBlack,
          ),
        ),
        const Gap(6),
        TextField(
          cursorColor: AppColor.semiBlack,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: hintStyle ??
                GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreen,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColor.darkGreen, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: AppColor.darkGreen, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.darkGreen,
                width: 1.5,
              ),
            ),
            focusColor: AppColor.darkGreen,
            hoverColor: AppColor.darkGreen,
          ),
        ),
        const Gap(16),
      ],
    );
  }
}
