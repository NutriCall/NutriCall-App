import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/plan/widget/calendar_widget.dart';
import 'package:nutri_call_app/features/plan/widget/plan_meal_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';

class PlanPage extends HookConsumerWidget {
  const PlanPage({super.key});

  Future<void> _refreshPlan() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Meal Plan'),
      body: RefreshIndicator(
        onRefresh: _refreshPlan,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Gap(5),
            CalendarWidget(
              onDateSelected: (selectedDay) {},
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Plan Meal",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  PlanMealWidget(
                    label: "Breakfast",
                    kcal: "311",
                    items: [
                      {
                        "name": "Milk",
                        "calories": 101,
                        "carbs": 59.8,
                        "protein": 2.6,
                        "fat": 0.8
                      },
                      {
                        "name": "Banana",
                        "calories": 210,
                        "carbs": 59.8,
                        "protein": 2.6,
                        "fat": 0.8
                      },
                    ],
                  ),
                  Gap(10),
                  PlanMealWidget(
                    label: "Lunch",
                    kcal: "0",
                    items: [],
                  ),
                  Gap(10),
                  PlanMealWidget(
                    label: "Dinner",
                    kcal: "450",
                    items: [
                      {
                        "name": "Fish",
                        "calories": 200,
                        "carbs": 0,
                        "protein": 25,
                        "fat": 5
                      },
                      {
                        "name": "Veggies",
                        "calories": 50,
                        "carbs": 10,
                        "protein": 2,
                        "fat": 0
                      },
                    ],
                  ),
                  Gap(10),
                  PlanMealWidget(
                    label: "Snacks/Other",
                    kcal: "150",
                    items: [
                      {
                        "name": "Apple",
                        "calories": 50,
                        "carbs": 10,
                        "protein": 2,
                        "fat": 0
                      },
                      {
                        "name": "Orange",
                        "calories": 100,
                        "carbs": 20,
                        "protein": 5,
                        "fat": 0
                      },
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
