import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/report/domain/entities/macronutrient_report_model.dart';
import 'package:nutri_call_app/features/report/widget/bar_chart_widget.dart';
import 'package:nutri_call_app/features/report/widget/custom_table_widget.dart';
import 'package:nutri_call_app/features/report/controllers/food_eaten_report_controller.dart';
import 'package:nutri_call_app/features/report/controllers/macronutrient_report_controller.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class TabContentMacros extends HookConsumerWidget {
  const TabContentMacros({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodEatenReportAsync =
        ref.watch(fetchFoodEatenReportNotifierProvider);
    final macronutrientReportAsync =
        ref.watch(fetchMacronutrientReportNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchFoodEatenReportNotifierProvider.notifier).fetch();
        ref.read(fetchMacronutrientReportNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(fetchFoodEatenReportNotifierProvider.notifier).fetch();
        ref.read(fetchMacronutrientReportNotifierProvider.notifier).fetch();
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
                              'Macronutriens',
                              style: GoogleFonts.poppins(
                                color: AppColor.semiBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Gap(8),
                            macronutrientReportAsync.when(
                              data: (data) {
                                final report =
                                    data.fold<MacronutrientReportModel?>(
                                  (error) => null,
                                  (report) => report,
                                );
                                List<List<double>> normalizeValues(
                                    List<MacronutrientGraphModel> graph) {
                                  return graph.map((e) {
                                    final carbs = e.carbs ?? 0;
                                    final proteins = e.proteins ?? 0;
                                    final fats = e.fats ?? 0;

                                    final total = carbs + proteins + fats;
                                    if (total == 0) {
                                      return [0.0, 0.0, 0.0];
                                    }

                                    final scale = 100 / total;

                                    return [
                                      (carbs * scale).toDouble(),
                                      (proteins * scale).toDouble(),
                                      (fats * scale).toDouble(),
                                    ];
                                  }).toList();
                                }

                                final normalizedYValues =
                                    normalizeValues(report?.graph ?? []);

                                return SizedBox(
                                  height: 130,
                                  child: BarChartWidget(
                                    yValues: normalizedYValues,
                                    colors: const [
                                      AppColor.blue,
                                      AppColor.orange,
                                      AppColor.pink,
                                    ],
                                  ),
                                );
                              },
                              loading: () => const Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.darkGreen,
                              )),
                              error: (error, _) => Text('Error: $error'),
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
                            macronutrientReportAsync.when(
                              data: (data) {
                                final report =
                                    data.fold<MacronutrientReportModel?>(
                                  (error) => null,
                                  (report) => report,
                                );

                                final todayMacro = report?.todayMacro;

                                return CustomTableWidget(
                                  rowCount: 4,
                                  columnCount: 4,
                                  data: [
                                    const ["", "", "Total", "Goal Percent"],
                                    [
                                      "A1",
                                      "Carbs",
                                      "${todayMacro?.carbs?.value?.toString() ?? '0.0'}g",
                                      "${todayMacro?.carbs?.percentage?.toString() ?? '0.0'}%",
                                    ],
                                    [
                                      "A2",
                                      "Protein",
                                      "${todayMacro?.proteins?.value?.toString() ?? '0.0'}g",
                                      "${todayMacro?.proteins?.percentage?.toString() ?? '0.0'}%",
                                    ],
                                    [
                                      "A3",
                                      "Fat",
                                      "${todayMacro?.fats?.value?.toString() ?? '0.0'}g",
                                      "${todayMacro?.fats?.percentage?.toString() ?? '0.0'}%",
                                    ],
                                  ],
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
                            foodEatenReportAsync.when(
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
                                        "${item.carbs}",
                                        "${item.proteins}",
                                        "${item.fats}",
                                      ];
                                    })
                                    .map((row) =>
                                        row.map((e) => e.toString()).toList())
                                    .toList();

                                final tableData = [
                                  ["Food", "Carbs(g)", "Prot(g)", "Fat(g)"],
                                  ...?modifiedFoodData,
                                ];
                                return CustomTableWidget(
                                  rowCount: (modifiedFoodData?.length ?? 0) + 1,
                                  columnCount: 4,
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
