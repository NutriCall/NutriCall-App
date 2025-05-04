import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/report/controllers/daily_calorie_report_controller.dart';
import 'package:nutri_call_app/features/report/controllers/food_eaten_report_controller.dart';
import 'package:nutri_call_app/features/report/widget/bar_chart_widget.dart';
import 'package:nutri_call_app/features/report/widget/custom_table_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class TabContentCalorie extends HookConsumerWidget {
  const TabContentCalorie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calorieAsync = ref.watch(fetchDailyCalorieReportNotifierProvider);
    final foodAsync = ref.watch(fetchFoodEatenReportNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchDailyCalorieReportNotifierProvider.notifier).fetch();
        ref.read(fetchFoodEatenReportNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(fetchDailyCalorieReportNotifierProvider.notifier).fetch();
        ref.read(fetchFoodEatenReportNotifierProvider.notifier).fetch();
      },
      color: AppColor.darkGreen,
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
                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.darkGreen,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Calories',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            calorieAsync.when(
                              data: (calorieData) {
                                double totalCalories = calorieData.fold(
                                  (error) => 0.0,
                                  (report) => report.totalCalToday ?? 0.0,
                                );

                                return Text(
                                  '${totalCalories.toStringAsFixed(0)} kcal',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.semiBlack,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.darkGreen,
                              )),
                              error: (error, _) => Text('Error: $error'),
                            ),
                            const Gap(4),
                            calorieAsync.when(
                              data: (calorieData) {
                                double goalCalories = calorieData.fold(
                                  (error) => 0.0,
                                  (report) => report.goal ?? 0.0,
                                );
                                double average = calorieData.fold(
                                  (error) => 0.0,
                                  (report) => report.average ?? 0.0,
                                );

                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Daily Average: ${average.toStringAsFixed(0)} kcal',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Goal: ${goalCalories.toStringAsFixed(0)} kcal',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]);
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.darkGreen,
                              )),
                              error: (error, _) => Text('Error: $error'),
                            ),
                            const Gap(4),
                            calorieAsync.when(
                              data: (calorieData) {
                                final graphData = calorieData.fold(
                                  (error) => <List<double>>[],
                                  (report) {
                                    final graph = report.graph;
                                    return graph?.map((day) {
                                          final total = (day.breakfast ?? 0.0) +
                                              (day.lunch ?? 0.0) +
                                              (day.dinner ?? 0.0) +
                                              (day.snacksOther ?? 0.0);
                                          return total > 0
                                              ? [
                                                  (day.breakfast ?? 0.0) /
                                                      total *
                                                      100,
                                                  (day.lunch ?? 0.0) /
                                                      total *
                                                      100,
                                                  (day.dinner ?? 0.0) /
                                                      total *
                                                      100,
                                                  (day.snacksOther ?? 0.0) /
                                                      total *
                                                      100,
                                                ]
                                              : [0.0, 0.0, 0.0, 0.0];
                                        }).toList() ??
                                        [];
                                  },
                                );

                                return SizedBox(
                                  height: 130,
                                  child: BarChartWidget(
                                    yValues: graphData,
                                    colors: const [
                                      AppColor.blue,
                                      AppColor.orange,
                                      AppColor.pink,
                                      AppColor.purple,
                                    ],
                                  ),
                                );
                              },
                              loading: () => const SizedBox(
                                height: 130,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: AppColor.darkGreen,
                                )),
                              ),
                              error: (error, _) =>
                                  Text('Error loading graph: $error'),
                            ),
                            const Gap(6),
                            Text(
                              'Today’s Calorie',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Gap(6),
                            calorieAsync.when(
                              data: (calorieData) {
                                final todayCalories = calorieData.fold(
                                  (error) => [],
                                  (report) => report.todayCalories,
                                );
                                final modifiedDataCalorie = todayCalories
                                    ?.asMap()
                                    .entries
                                    .map((entry) {
                                      final index = entry.key;
                                      final item = entry.value;
                                      final code = "A${index + 1}";
                                      return [
                                        code,
                                        item.type,
                                        "${item.percentage}%",
                                        "${item.calories.toStringAsFixed(0)} kcal",
                                      ];
                                    })
                                    .toList()
                                    .map((row) =>
                                        row.map((e) => e.toString()).toList())
                                    .toList();

                                return CustomTableWidget(
                                  rowCount: modifiedDataCalorie?.length ?? 0,
                                  columnCount: 4,
                                  data: modifiedDataCalorie ?? [],
                                );
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.darkGreen,
                              )),
                              error: (error, _) => Text('Error: $error'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
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
                              'Today’s Food Eatean',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Gap(8),
                            foodAsync.when(
                              data: (foodData) {
                                final items = foodData.fold(
                                  (error) => [],
                                  (report) => report.items,
                                );

                                final modifiedFoodData = items
                                    ?.asMap()
                                    .entries
                                    .map((entry) {
                                      final item = entry.value;
                                      return [
                                        item.name,
                                        "x${item.count.toString()}",
                                        "${item.calories.toStringAsFixed(0)} kcal",
                                      ];
                                    })
                                    .map((row) =>
                                        row.map((e) => e.toString()).toList())
                                    .toList();

                                final tableData = [
                                  ["Food", "Time/Eaten", "Calories"],
                                  ...?modifiedFoodData,
                                ];
                                return CustomTableWidget(
                                  rowCount: (modifiedFoodData?.length ?? 0) + 1,
                                  columnCount: 3,
                                  data: tableData,
                                );
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.darkGreen,
                              )),
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
