import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nutri_call_app/features/progress/widget/area_chart_widget.dart';
import 'package:nutri_call_app/features/progress/widget/circular_percent_widget.dart';
import 'package:nutri_call_app/features/progress/widget/line_percent_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ProgressPage extends HookConsumerWidget {
  const ProgressPage({super.key});

    Future<void> _refreshRecipes() async {
      await Future.delayed(const Duration(seconds: 2));
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ChartData> customChartData = generateChartData();

    return RefreshIndicator(
      onRefresh: _refreshRecipes,
      color: AppColor.semiBlack,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Progress'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nutrition Tracker',
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
                  'Weight Tracker',
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
                  child:Row(
                    children: [
                      Expanded(
                        flex: 2, 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Goal',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.lightBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(4),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '46 / ',
                                        style: GoogleFonts.poppins(
                                          color: AppColor.semiBlack,
                                          fontWeight: FontWeight.w600, 
                                          fontSize: 20
                                        ),
                                      ),
                                      TextSpan(
                                        text: '50 Kg',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600, 
                                          fontSize: 20,
                                          color: AppColor.lightBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(36),
                            Text(
                              DateFormat("d MMMM y", "id").format(DateTime.now()),
                              style: GoogleFonts.poppins(
                                color: AppColor.lightBlack,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3, 
                        child: AreaChartWidget(chartData: customChartData),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ChartData> generateChartData() {
    List<ChartData> chartData = [];
    DateTime today = DateTime.now();
    List<double> fixedValues = [55, 60, 70, 62, 68];
    for (int i = 0; i < fixedValues.length; i++) {
      DateTime date = today.subtract(Duration(days: 4 - i));
      String formattedDate = DateFormat('dd/MM').format(date);
      double customValue = fixedValues[i];
      chartData.add(ChartData(formattedDate, customValue));
    }
    return chartData;
  }

}




