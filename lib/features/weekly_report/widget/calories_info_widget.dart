import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CaloriesInfoWidget extends StatelessWidget {
  final String calories;
  final String description;

  const CaloriesInfoWidget({
    super.key,
    required this.calories,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.darkGreen,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: calories,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'kcal',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              description,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
