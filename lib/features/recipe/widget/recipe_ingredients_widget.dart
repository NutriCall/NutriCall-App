import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeIngredientsWidget extends StatelessWidget {
  final List<String> ingredients;

  const RecipeIngredientsWidget({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ingredients:",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        ...ingredients.map(
          (ingredient) => Text(
            "• $ingredient",
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
