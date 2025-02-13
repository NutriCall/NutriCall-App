import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/report/widget/bar_chart_widget.dart';
import 'package:nutri_call_app/features/report/widget/custom_table_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class TabContentCalorie extends HookConsumerWidget {
  const TabContentCalorie({super.key});

    Future<void> _refreshCalorie() async {
      await Future.delayed(const Duration(seconds: 2));
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<List<String>> dataCalorie = [
      ["A1", "Breakfast", "20%", "105"],
      ["A2", "Lunch", "37%", "195"],
      ["A3", "Dinner", "35%", "150"],
      ["A4", "Snacks/other", "8%", "75"],
    ];

    final List<List<String>> modifiedDataCalorie = dataCalorie.map((row) {
      return List<String>.from(row)..[3] += " kcal";
    }).toList();

    final List<List<String>> dataFoods = [
      ["Foods", "Time\nEatean", "Cals"],
      ["Chicken Breast", "x1", "195"],
      ["Banana", "x1", "105"],
      ["Total", "x2", "300"],
    ];

    final List<List<String>> modifiedDataFoods = dataFoods.asMap().map((rowIndex, row) {
      return MapEntry(
        rowIndex,
        List<String>.from(row)..[2] = (rowIndex != 0) ? "${row[2]} kcal" : row[2],
      );
    }).values.toList();


    return RefreshIndicator(
      onRefresh: _refreshCalorie,
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
                            Text(
                              '105',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Gap(4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daily Average: 105',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Goal: 2200kcal',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(4),
                            const SizedBox(
                              height: 130,
                              child: BarChartWidget(
                                yValues: [
                                  [10, 15, 20, 10],  
                                  [12, 18, 25, 20], 
                                  [14, 10, 22, 10], 
                                  [16, 12, 28, 15],  
                                  [18, 14, 30, 16], 
                                  [20, 16, 35, 5], 
                                  [22, 18, 40, 9],  
                                ],
                                colors: [AppColor.blue, AppColor.orange, AppColor.pink, AppColor.purple],
                              )
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
                            CustomTableWidget(
                              rowCount: 4,
                              columnCount: 4,
                              data: modifiedDataCalorie
                            )
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
                          CustomTableWidget(
                            rowCount: 4,
                            columnCount: 3,
                            data: modifiedDataFoods
                          )
                        ]
                      ),
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