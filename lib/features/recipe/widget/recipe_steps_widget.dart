import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipeStepsWidget extends StatelessWidget {
  final List<String> steps;

  const RecipeStepsWidget({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Steps:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColor.semiBlack
          ),
        ),
        const Gap(4),
        ...steps.map(
          (step) => Text(
            "• $step",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColor.semiBlack
            ),
          ),
        ),
      ],
    );
  }
}
