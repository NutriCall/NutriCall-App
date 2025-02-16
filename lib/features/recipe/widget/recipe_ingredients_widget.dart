import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipeIngredientsWidget extends StatelessWidget {
  final List<String> ingredients;

  const RecipeIngredientsWidget({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColor.semiBlack
          ),
        ),
        const Gap(4),
        ...ingredients.map(
          (ingredient) => Text(
            "• $ingredient",
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
