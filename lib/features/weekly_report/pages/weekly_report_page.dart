import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/weekly_report/widget/area_chart_weekly_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/calories_info_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/circular_percent_weekly_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/nutrition_info_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class WeeklyReportPage extends HookConsumerWidget {
  const WeeklyReportPage({super.key});

    Future<void> _refreshRecipes() async {
      await Future.delayed(const Duration(seconds: 2));
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChartDataWeekly> customChartData = generateChartDataWeekly();

    return RefreshIndicator(
      onRefresh: _refreshRecipes,
      color: AppColor.semiBlack,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Weekly Report',
          onBack: (){
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CaloriesInfoWidget(
                      calories: "8.200", 
                      description: "Target Calories"
                    ),
                    CaloriesInfoWidget(
                      calories: "2.207", 
                      description: "Calories Recorded"
                    ),
                    CaloriesInfoWidget(
                      calories: "3.800", 
                      description: "Calories Burned"
                    )
                  ],
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
                  child: const Column(
                      children: [
                        NutritionInfoWidget(
                          color: AppColor.blue, 
                          percentage: "60%", 
                          description: "Carbohydrates are food components that serve as the main source of energy for the body."
                        ),
                        Gap(12),
                        NutritionInfoWidget(
                          color: AppColor.orange, 
                          percentage: "20%", 
                          description: "Proteins helps the immune system, and is the building block for cells and tissues."
                        ),
                        Gap(12),
                        NutritionInfoWidget(
                          color: AppColor.pink, 
                          percentage: "20%", 
                          description: "Fat is an essential nutrient that serves as a source of energy, protects the body's organs, and helps the absorption process of vitamins."
                        )
                      ],
                    ),
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
                Center(child: AreaChartWeeklyWidget(chartData: customChartData)),
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
                Center(
                  child: CircularPercentWeelyWidget(
                    percentages: const [0.16, 0.259, 0.308, 0.084, 0.125, 0.064],
                    progressColors: const [AppColor.blue, AppColor.orange, AppColor.purple, AppColor.yellow, AppColor.lightGreen, AppColor.pink],
                    backgroundColor: Colors.grey[300]!, 
                    labels: const [
                      "Carbohydrates",
                      "Proteins",
                      "Calories",
                      "Fats",
                      "Vitamins",
                      "Fibers",],
                  ),
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
}