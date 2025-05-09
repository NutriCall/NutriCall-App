import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? suffixText;
  final String? errorText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.label,
    this.suffixText,
    this.errorText,
    this.onTap,
    this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              color: AppColor.darkGreen,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        const Gap(5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.darkWhite2,
            border: Border.all(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: GestureDetector(
                    onTap: onTap,
                    child: TextField(
                      readOnly: readOnly,
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusColor: AppColor.semiBlack,
                          errorText: errorText,
                          errorStyle: GoogleFonts.poppins(
                              color: AppColor.lightRed,
                              fontSize: 10,
                              fontWeight: FontWeight.w400)),
                      style: GoogleFonts.poppins(
                          color: AppColor.semiBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      cursorColor: AppColor.semiBlack,
                    ),
                  ),
                ),
              ),
              if (suffixText != null)
                Text(
                  suffixText ?? '',
                  style: GoogleFonts.poppins(
                      color: AppColor.semiBlack,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
