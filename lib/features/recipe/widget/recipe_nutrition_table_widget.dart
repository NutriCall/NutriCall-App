import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipeNutritionTableWidget extends StatelessWidget {
  final Map<String, String> nutritionData;

  const RecipeNutritionTableWidget({
    super.key,
    required this.nutritionData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.darkGreen, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: nutritionData.entries.map((entry) {
          int index = nutritionData.keys.toList().indexOf(entry.key);
          bool isLastItem = index == nutritionData.length - 1;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key, 
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              if (!isLastItem)
                const Divider(
                  color: AppColor.darkWhite3, 
                  thickness: 1,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
