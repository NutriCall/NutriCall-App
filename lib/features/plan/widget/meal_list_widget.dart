import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/plan/widget/meal_item_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MealListWidget extends StatefulWidget {
  final List<MealItem> meals;
  final Function(List<MealItem>) onSelectionChanged;

  const MealListWidget({
    super.key,
    required this.meals,
    required this.onSelectionChanged,
  });

  @override
  _MealListWidgetState createState() => _MealListWidgetState();
}

class _MealListWidgetState extends State<MealListWidget> {
  List<MealItem> selectedMeals = [];

  void _updateSelection(MealItem meal, bool? isSelected) {
    setState(() {
      meal.isSelected = isSelected ?? false;
      selectedMeals = widget.meals.where((m) => m.isSelected).toList();
    });
    widget.onSelectionChanged(selectedMeals);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'List of Meals',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.semiBlack,
          ),
        ),
        const Gap(10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.meals.length,
          itemBuilder: (context, index) {
            final meal = widget.meals[index];
            return MealItemWidget(
              meal: meal,
              onChanged: (isChecked) => _updateSelection(meal, isChecked),
            );
          },
        ),
      ],
    );
  }
}
