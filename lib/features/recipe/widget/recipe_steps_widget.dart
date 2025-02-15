import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeStepsWidget extends StatelessWidget {
  final List<String> steps;

  const RecipeStepsWidget({
    Key? key,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Steps:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        ...steps.map(
          (step) => Text(
            "• $step",
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
