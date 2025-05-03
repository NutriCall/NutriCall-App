import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class NutritionInfoWidget extends StatelessWidget {
  final Color color;
  final String percentage;
  final String description;

  const NutritionInfoWidget({
    super.key,
    required this.color,
    required this.percentage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              percentage,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const Gap(12),
        SizedBox(
          width: 250,
          child: Text(
            description,
            style: GoogleFonts.poppins(
              color: AppColor.semiBlack,
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
