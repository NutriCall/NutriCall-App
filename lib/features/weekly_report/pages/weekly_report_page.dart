import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_macros_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/widget/area_chart_weekly_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/calories_info_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/circular_percent_weekly_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/nutrition_info_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/features/weekly_report/controllers/weekly_calories_report_controller.dart';
import 'package:nutri_call_app/features/weekly_report/controllers/weekly_macros_report_controller.dart';
import 'package:nutri_call_app/features/weekly_report/controllers/weekly_graph_calories_controller.dart';
import 'package:nutri_call_app/features/weekly_report/controllers/weekly_resume_report_controller.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class WeeklyReportPage extends HookConsumerWidget {
  const WeeklyReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyCaloriesAsync =
        ref.watch(fetchWeeklyCaloriesReportNotifierProvider);
    final weeklyMacrosAsync =
        ref.watch(fetchWeeklyMacrosReportNotifierProvider);
    final weeklyGraphAsync =
        ref.watch(fetchWeeklyGraphCaloriesReportNotifierProvider);
    final weeklyResumeAsync =
        ref.watch(fetchWeeklyResumeReportNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchWeeklyCaloriesReportNotifierProvider.notifier).fetch();
        ref.read(fetchWeeklyMacrosReportNotifierProvider.notifier).fetch();
        ref
            .read(fetchWeeklyGraphCaloriesReportNotifierProvider.notifier)
            .fetch();
        ref.read(fetchWeeklyResumeReportNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(fetchWeeklyCaloriesReportNotifierProvider.notifier).fetch();
        ref.read(fetchWeeklyMacrosReportNotifierProvider.notifier).fetch();
        ref
            .read(fetchWeeklyGraphCaloriesReportNotifierProvider.notifier)
            .fetch();
        ref.read(fetchWeeklyResumeReportNotifierProvider.notifier).fetch();
      },
      color: AppColor.darkGreen,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Weekly Report',
          onBack: () {
            context.pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(8),
                weeklyCaloriesAsync.when(
                  data: (either) => either.fold(
                      (errorMessage) => Text('Error: $errorMessage'),
                      (data) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CaloriesInfoWidget(
                                  calories: data.weeklyGoal!.toString(),
                                  description: "Target Calories",
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                flex: 1,
                                child: CaloriesInfoWidget(
                                  calories: data.weeklyConsumed!.toString(),
                                  description: "Calories Recorded",
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                flex: 1,
                                child: CaloriesInfoWidget(
                                  calories: data.difference.toString(),
                                  description: "Calories Left",
                                ),
                              ),
                            ],
                          )),
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: AppColor.darkGreen,
                  )),
                  error: (error, stackTrace) => Text('Error: $error'),
                ),
                const Gap(20),
                Text(
                  'What have you eaten this week?',
                  style: GoogleFonts.poppins(
                    color: AppColor.semiBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                weeklyMacrosAsync.when(
                  data: (either) => either.fold(
                    (errorMessage) => Text('Error: $errorMessage'),
                    (data) {
                      final items = data.items;

                      String getPercentage(String name) {
                        final item = items.firstWhere(
                          (e) => e.name.toLowerCase() == name.toLowerCase(),
                          orElse: () => const MacroItem(
                              name: '', total: 0, percentage: 0),
                        );
                        return '${item.percentage}%';
                      }

                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColor.darkGreen,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            NutritionInfoWidget(
                              color: AppColor.blue,
                              percentage: getPercentage('Karbohidrat'),
                              description:
                                  "Carbohydrates are food components that serve as the main source of energy for the body.",
                            ),
                            const Gap(12),
                            NutritionInfoWidget(
                              color: AppColor.orange,
                              percentage: getPercentage('Protein'),
                              description:
                                  "Proteins helps the immune system, and is the building block for cells and tissues.",
                            ),
                            const Gap(12),
                            NutritionInfoWidget(
                              color: AppColor.pink,
                              percentage: getPercentage('Lemak'),
                              description:
                                  "Fat is an essential nutrient that serves as a source of energy, protects the body's organs, and helps the absorption process of vitamins.",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: AppColor.darkGreen,
                  )),
                  error: (error, stackTrace) => Text('Error: $error'),
                ),
                const Gap(20),
                Text(
                  'Weekly Calories',
                  style: GoogleFonts.poppins(
                    color: AppColor.semiBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(10),
                weeklyGraphAsync.when(
                  data: (either) => either.fold(
                    (error) => Center(child: Text(error)),
                    (data) {
                      final chartData = data.graph!.map((item) {
                        final day = DateTime.parse(item.date).weekday % 7;
                        final dayName = [
                          'SUN',
                          'MON',
                          'TUE',
                          'WED',
                          'THU',
                          'FRI',
                          'SAT'
                        ][day];
                        return ChartDataWeekly(
                            dayName, item.percentageOfGoal ?? 0.0);
                      }).toList();

                      return AreaChartWeeklyWidget(chartData: chartData);
                    },
                  ),
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: AppColor.darkGreen,
                  )),
                  error: (err, stack) => Center(child: Text(err.toString())),
                ),
                const Gap(20),
                Text(
                  'Weekly Resume',
                  style: GoogleFonts.poppins(
                    color: AppColor.semiBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(30),
                weeklyResumeAsync.when(
                  data: (either) => either.fold(
                    (error) => Center(child: Text('Error: $error')),
                    (data) {
                      final filteredEntries = data.nutrientPercentage?.entries
                          .where((entry) => entry.value > 0)
                          .toList();

                      final percentages = <double>[];
                      final labels = <String>[];
                      final colors = <Color>[];

                      final totalNonZero = filteredEntries?.fold<double>(
                          0, (sum, entry) => sum + entry.value);

                      for (var i = 0; i < filteredEntries!.length; i++) {
                        final entry = filteredEntries[i];
                        percentages.add(entry.value / totalNonZero!);
                        labels.add(_mapKeyToLabel(entry.key));
                        colors.add(AppColor.defaultColorPalette[
                            i % AppColor.defaultColorPalette.length]);
                      }

                      return Center(
                        child: CircularPercentWeelyWidget(
                          percentages: percentages,
                          progressColors: colors,
                          backgroundColor: Colors.grey[300]!,
                          labels: labels,
                        ),
                      );
                    },
                  ),
                  loading: () => const Center(
                      child: CircularProgressIndicator(
                    color: AppColor.darkGreen,
                  )),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
                const Gap(100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ChartDataWeekly> generateChartDataWeekly() {
    List<ChartDataWeekly> chartDataWeekly = [];
    DateTime today = DateTime.now();
    List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    List<double> fixedValues = [55, 60, 70, 62, 68, 75, 80];

    for (int i = 0; i < 7; i++) {
      DateTime date = today.subtract(Duration(days: today.weekday % 7 - i));
      String dayName = weekDays[date.weekday % 7];
      double customValue = fixedValues[i % fixedValues.length];
      chartDataWeekly.add(ChartDataWeekly(dayName, customValue));
    }
    return chartDataWeekly;
  }

  String _mapKeyToLabel(String key) {
    const mapping = {
      'total_air': 'Water',
      'total_energi': 'Calories',
      'total_protein': 'Proteins',
      'total_lemak': 'Fats',
      'total_karbohidrat': 'Carbohydrates',
      'total_serat': 'Fibers',
      'total_abu': 'Ash',
      'total_kalsium': 'Calcium',
      'total_fosfor': 'Phosphorus',
      'total_besi': 'Iron',
      'total_natrium': 'Natrium',
      'total_kalium': 'Kalium',
      'total_tembaga': 'Copper',
      'total_seng': 'Zinc',
      'total_retinol': 'Vitamin A',
      'total_beta_karoten': 'Beta Carotene',
      'total_karoten_total': 'Total Carotene',
      'total_tiamin': 'Vitamin B1',
      'total_riboflavin': 'Vitamin B2',
      'total_niasin': 'Vitamin B3',
      'total_vit_c': 'Vitamin C',
    };

    return mapping[key] ?? key;
  }
}
