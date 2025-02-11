import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? suffixText;

  const CustomTextField({
    super.key,
    required this.label,
    this.suffixText,
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
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),
              if (suffixText != null)
                Text(
                  suffixText ?? '',
                  style: GoogleFonts.poppins(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
