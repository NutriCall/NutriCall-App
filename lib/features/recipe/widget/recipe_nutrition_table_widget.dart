import 'package:flutter/material.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class RecipeNutritionTableWidget extends StatelessWidget {
  final Map<String, String> nutritionData;

  const RecipeNutritionTableWidget({
    Key? key,
    required this.nutritionData,
  }) : super(key: key);

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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.key, style: const TextStyle(fontSize: 14)),
                Text(entry.value,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
