import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/report/domain/entities/nutrient_model.dart';
import 'package:nutri_call_app/features/report/widget/custom_table_widget.dart';
import 'package:nutri_call_app/features/report/controllers/nutrient_controllers.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class TabContentNutrient extends HookConsumerWidget {
  const TabContentNutrient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutrientAsync = ref.watch(fetchNutrientReportNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchNutrientReportNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(fetchNutrientReportNotifierProvider.notifier).fetch();
      },
      color: AppColor.semiBlack,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.darkGreen,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today’s Nutrient',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Gap(8),
                            nutrientAsync.when(
                              data: (data) {
                                final report = data.fold(
                                  (l) => null,
                                  (r) => r,
                                );

                                final nutrients = report ?? [];

                                String formatValue(dynamic value) {
                                  if (value is num) {
                                    return value.toStringAsFixed(1);
                                  } else {
                                    return value.toString();
                                  }
                                }

                                String getConsumed(String name) {
                                  final match = nutrients.firstWhere(
                                    (n) => n.name.toLowerCase() == name,
                                    orElse: () => const NutrientItemModel(
                                        name: '',
                                        consumed: 0.0,
                                        goal: '-',
                                        difference: '-'),
                                  );
                                  return formatValue(match.consumed);
                                }

                                String getGoal(String name) {
                                  final match = nutrients.firstWhere(
                                    (n) => n.name.toLowerCase() == name,
                                    orElse: () => const NutrientItemModel(
                                        name: '',
                                        consumed: 0.0,
                                        goal: '-',
                                        difference: '-'),
                                  );
                                  return formatValue(match.goal);
                                }

                                String getDifference(String name) {
                                  final match = nutrients.firstWhere(
                                    (n) => n.name.toLowerCase() == name,
                                    orElse: () => const NutrientItemModel(
                                        name: '',
                                        consumed: 0.0,
                                        goal: '-',
                                        difference: '-'),
                                  );
                                  return formatValue(match.difference);
                                }

                                return CustomTableWidget(
                                  rowCount: 13,
                                  columnCount: 4,
                                  data: [
                                    ["Nutrient", "Total", "Goal", "[+/-]"],
                                    [
                                      "Calories (kcal)",
                                      formatValue(getConsumed("energi")),
                                      formatValue(getGoal("energi")),
                                      formatValue(getDifference("energi"))
                                    ],
                                    [
                                      "Protein (g)",
                                      formatValue(getConsumed("protein")),
                                      formatValue(getGoal("protein")),
                                      formatValue(getDifference("protein"))
                                    ],
                                    [
                                      "Carbohydrate (g)",
                                      formatValue(getConsumed("karbohidrat")),
                                      formatValue(getGoal("karbohidrat")),
                                      formatValue(getDifference("karbohidrat"))
                                    ],
                                    [
                                      "Fiber (g)",
                                      formatValue(getConsumed("serat")),
                                      formatValue(getGoal("serat")),
                                      formatValue(getDifference("serat"))
                                    ],
                                    [
                                      "Fat (g)",
                                      formatValue(getConsumed("lemak")),
                                      formatValue(getGoal("lemak")),
                                      formatValue(getDifference("lemak"))
                                    ],
                                    [
                                      "Natrium (mg)",
                                      formatValue(getConsumed("natrium")),
                                      formatValue(getGoal("natrium")),
                                      formatValue(getDifference("natrium"))
                                    ],
                                    [
                                      "Kalium (mg)",
                                      formatValue(getConsumed("kalium")),
                                      formatValue(getGoal("kalium")),
                                      formatValue(getDifference("kalium"))
                                    ],
                                    [
                                      "Water (g)",
                                      formatValue(getConsumed("air")),
                                      formatValue(getGoal("air")),
                                      formatValue(getDifference("air"))
                                    ],
                                    [
                                      "Ash (g)",
                                      formatValue(getConsumed("abu")),
                                      formatValue(getGoal("abu")),
                                      formatValue(getDifference("abu"))
                                    ],
                                    [
                                      "Calcium (mg)",
                                      formatValue(getConsumed("kalsium")),
                                      formatValue(getGoal("kalsium")),
                                      formatValue(getDifference("kalsium"))
                                    ],
                                    [
                                      "Iron (mg)",
                                      formatValue(getConsumed("besi")),
                                      formatValue(getGoal("besi")),
                                      formatValue(getDifference("besi"))
                                    ],
                                    [
                                      "Zinc (mg)",
                                      formatValue(getConsumed("seng")),
                                      formatValue(getGoal("seng")),
                                      formatValue(getDifference("seng"))
                                    ],
                                    [
                                      "Phosphor (mg)",
                                      formatValue(getConsumed("fosfor")),
                                      formatValue(getGoal("fosfor")),
                                      formatValue(getDifference("fosfor"))
                                    ],
                                    [
                                      "Copper (mg)",
                                      formatValue(getConsumed("tembaga)")),
                                      formatValue(getGoal("tembaga")),
                                      formatValue(getDifference("tembaga"))
                                    ],
                                    [
                                      "Vitamin A (mcg)",
                                      formatValue(getConsumed("retinol)")),
                                      formatValue(getGoal("retinol")),
                                      formatValue(getDifference("retinol"))
                                    ],
                                    [
                                      "Beta Carotene (mcg)",
                                      formatValue(getConsumed("beta_karoten")),
                                      formatValue(getGoal("beta_karoten")),
                                      formatValue(getDifference("beta_karoten"))
                                    ],
                                    [
                                      "Total Carotene (mcg)",
                                      formatValue(getConsumed("karoten_total")),
                                      formatValue(getGoal("karoten_total")),
                                      formatValue(
                                          getDifference("karoten_total"))
                                    ],
                                    [
                                      "Vitamin B1 (mg)",
                                      formatValue(getConsumed("thiamin)")),
                                      formatValue(getGoal("thiamin")),
                                      formatValue(getDifference("thiamin"))
                                    ],
                                    [
                                      "Vitamin B2 (mg)",
                                      formatValue(getConsumed("riboflavin")),
                                      formatValue(getGoal("riboflavin")),
                                      formatValue(getDifference("riboflavin"))
                                    ],
                                    [
                                      "Vitamin B3 (mg)",
                                      formatValue(getConsumed("niasin")),
                                      formatValue(getGoal("niasin")),
                                      formatValue(getDifference("niasin"))
                                    ],
                                    [
                                      "Vitamin C (mg)",
                                      formatValue(getConsumed("vit_c")),
                                      formatValue(getGoal("vit_c")),
                                      formatValue(getDifference("vit_c"))
                                    ],
                                  ],
                                );
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                              error: (error, _) => Text('Error: $error'),
                            ),
                          ]),
                    ],
                  ),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
