import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MealItem {
  final int id;
  final String name;
  final int kcal;
  bool isSelected;

  MealItem({
    required this.id,
    required this.name,
    required this.kcal,
    this.isSelected = false,
  });
}

class MealItemWidget extends StatelessWidget {
  final MealItem meal;
  final Function(bool?) onChanged;

  const MealItemWidget({
    super.key,
    required this.meal,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${meal.name} (${meal.kcal} kcal)',
        style: GoogleFonts.poppins(
          color: AppColor.darkGreen,
        ),
      ),
      trailing: Checkbox(
        value: meal.isSelected,
        onChanged: onChanged,
        activeColor: meal.isSelected ? AppColor.darkGreen : null,
        side: const BorderSide(color: AppColor.darkGreen),
      ),
    );
  }
}
