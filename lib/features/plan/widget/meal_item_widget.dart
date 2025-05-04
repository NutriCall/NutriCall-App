import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class MealItem {
  final int id;
  final String name;
  final double kcal;
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
      title: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: '${meal.name} (${meal.kcal}',
          style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColor.darkGreen),
        ),
        TextSpan(
          text: 'kcal',
          style: GoogleFonts.poppins(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: AppColor.darkGreen),
        ),
        TextSpan(
          text: ')',
          style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColor.darkGreen),
        )
      ])),
      trailing: Checkbox(
        value: meal.isSelected,
        onChanged: onChanged,
        activeColor: meal.isSelected ? AppColor.darkGreen : null,
        side: const BorderSide(color: AppColor.darkGreen),
      ),
      onTap: () {
        context.pushNamed(
          RouteName.itemDetailMealPage,
          pathParameters: {
            'id': meal.id.toString(),
            'name': meal.name,
          },
        );
      },
    );
  }
}
