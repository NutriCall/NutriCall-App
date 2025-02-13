import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/report/widget/bar_chart_widget.dart';
import 'package:nutri_call_app/features/report/widget/custom_table_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class TabContentMacros extends HookConsumerWidget {
  const TabContentMacros({super.key});

    Future<void> _refreshCalorie() async {
      await Future.delayed(const Duration(seconds: 2));
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<List<String>> dataMacro = [
      ["", "", "Total", "Goal"],
      ["A1", "Carbs", "35%", "50%"],
      ["A2", "Protein", "24%", "30%"],
      ["A3", "Fat", "41%", "20%"],
    ];

    final List<List<String>> dataFoods = [
      ["Foods", "Carbs\n(g)", "Prot\n(g)", "Fat\n(g)"],
      ["Chicken Breast", "26.95", "1.29", "0.39"],
      ["Banana", "0.00", "7.72", "7.72"],
      ["Total", "26.95", "8.11", "30.84"],
    ];

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
                              'Macronutriens',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Gap(8),
                            const SizedBox(
                              height: 130,
                              child: BarChartWidget(
                                yValues: [
                                  [10, 15, 20],  
                                  [12, 18, 25], 
                                  [14, 10, 22], 
                                  [16, 12, 28],  
                                  [18, 14, 30], 
                                  [20, 16, 35], 
                                  [22, 18, 40],  
                                ],
                                colors: [AppColor.blue, AppColor.orange, AppColor.pink],
                              )
                            ),
                            const Gap(6),
                            Text(
                              'Today’s Macro',
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
                              data: dataMacro
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
                            columnCount: 4,
                            data: dataFoods
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