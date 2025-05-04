import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/extensions/build_context.ext.dart';
import 'package:nutri_call_app/features/plan/controllers/delete_plan_controllers.dart';
import 'package:nutri_call_app/features/plan/widget/calendar_widget.dart';
import 'package:nutri_call_app/features/plan/widget/plan_meal_widget.dart';
import 'package:nutri_call_app/features/plan/controllers/meal_plan_controller.dart';
import 'package:nutri_call_app/helpers/buttons/buttons.dart';
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
        color: AppColor.semiBlack,
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
            const CalendarWidget(),
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
                        onDelete: (item) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 27, vertical: 22),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.delete,
                                        weight: 50,
                                        size: 50,
                                        color: Color(0xFFFD6464),
                                      ),
                                      const Gap(24),
                                      Text(
                                        'Are you sure you want to delete ${item["name"]}?',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: AppColor.textColor2,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Gap(24),
                                      Button.filled(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        label: 'No',
                                        color: AppColor.lightRed,
                                      ),
                                      const Gap(8),
                                      Button.outlined(
                                        textColor: AppColor.textColor2,
                                        color: Colors.transparent,
                                        onPressed: () {
                                          final ids = plan.meals
                                              .where((meal) =>
                                                  meal.foodComposition
                                                      .namaBahan ==
                                                  item["name"])
                                              .map((meal) => meal.id)
                                              .toList();

                                          for (var id in ids) {
                                            ref
                                                .read(
                                                    fetchDeletePlanNotifierProvider
                                                        .notifier)
                                                .fetch(
                                                  onSuccess: () {
                                                    context.showSuccessSnackbar(
                                                        'Delete is successful for meal id: $id');
                                                  },
                                                  mealId: id,
                                                );
                                          }
                                          ref
                                              .read(
                                                  fetchMealPlanNotifierProvider
                                                      .notifier)
                                              .fetch();
                                          Navigator.pop(context);
                                        },
                                        label: 'Yes',
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          });
                        },
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
                loading: () => const Center(
                    child:
                        CircularProgressIndicator(color: AppColor.darkGreen)),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
