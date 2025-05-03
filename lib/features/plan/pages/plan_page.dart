import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/plan/widget/calendar_widget.dart';
import 'package:nutri_call_app/features/plan/widget/plan_meal_widget.dart';
import 'package:nutri_call_app/features/plan/controllers/meal_plan_controller.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class PlanPage extends HookConsumerWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealPlanController = ref.watch(fetchMealPlanNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchMealPlanNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Meal Plan'),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(fetchMealPlanNotifierProvider.notifier).fetch();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.semiBlack),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.semiBlack),
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: mealPlanController.when(
                data: (either) => either.fold(
                  (error) => Center(child: Text('Error: $error')),
                  (mealPlanList) => ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemCount: mealPlanList.length,
                    separatorBuilder: (_, __) => const Gap(10),
                    itemBuilder: (context, index) {
                      final plan = mealPlanList[index];
                      return PlanMealWidget(
                        label: plan.type,
                        kcal: plan.totalEnergi.toStringAsFixed(0),
                        items: plan.meals.map((meal) {
                          final fc = meal.foodComposition;
                          return {
                            "name": fc.namaBahan,
                            "calories": fc.energi,
                            "carbs": fc.karbohidrat,
                            "protein": fc.protein,
                            "fat": fc.lemak,
                          };
                        }).toList(),
                      );
                    },
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
