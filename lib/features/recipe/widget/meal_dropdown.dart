import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MealDropdown extends HookConsumerWidget {
  final String selectedMeal;
  final void Function(String value) onChanged;

  const MealDropdown({
    super.key,
    required this.selectedMeal,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
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
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
