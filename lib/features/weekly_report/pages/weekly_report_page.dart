import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/progress/widget/circular_percent_widget.dart';
import 'package:nutri_call_app/features/progress/widget/line_percent_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/area_chart_weekly_widget.dart';
import 'package:nutri_call_app/features/weekly_report/widget/circular_percent_weekly_widget.dart';
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
                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.darkGreen,
                      width: 1,
                    ),
                  ),
                  child:Row(
                    children: [
                      Expanded(
                        flex: 3, 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consumed',
                                    style: GoogleFonts.poppins(
                                      color: AppColor.lightBlack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Gap(4),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.poppins(
                                        color: AppColor.semiBlack,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '615 ',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600, fontSize: 20),
                                        ),
                                        TextSpan(
                                          text: 'kcal',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(12),
                            const Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: LinePercentWidget(
                                    title: 'Carbs',
                                    percent: 0.2,
                                    progressColor: AppColor.blue,
                                    valueText: '13 / 228 g',
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: LinePercentWidget(
                                    title: 'Protein',
                                    percent: 0.4,
                                    progressColor: AppColor.orange,
                                    valueText: '27 / 91 g',
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: LinePercentWidget(
                                    title: 'Fat',
                                    percent: 0.7,
                                    progressColor: AppColor.pink,
                                    valueText: '52 / 61 g',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 2, 
                        child: CircularPercentWidget(
                          percent: 0.3,
                          progressColor: AppColor.darkGreen,
                          backgroundColor: AppColor.disabledGreen,
                          value1: '1212',
                          value2: 'kcal remaining',
                        ),
                      ),
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
                const Gap(10),
                Center(
                  child: CircularPercentWeelyWidget(
                    percentages: const [0.16, 0.259, 0.308, 0.084, 0.125, 0.064],
                    progressColors: const [AppColor.blue, AppColor.orange, AppColor.purple, AppColor.yellow, AppColor.lightGreen, AppColor.pink],
                    backgroundColor: Colors.grey[300]!,
                  ),
                ),
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