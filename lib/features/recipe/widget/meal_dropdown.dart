import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MealDropdown extends StatefulWidget {
  const MealDropdown({super.key});

  @override
  _MealDropdownState createState() => _MealDropdownState();
}

class _MealDropdownState extends State<MealDropdown> {
  String selectedMeal = 'Breakfast';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            isDense: true,
            value: selectedMeal,
            items: ['Breakfast', 'Lunch', 'Dinner', 'Snacks/Other']
                .map((meal) => DropdownMenuItem(
                      value: meal,
                      child: Text(
                        meal,
                        style: GoogleFonts.poppins(
                            color: AppColor.darkGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedMeal = value!;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
