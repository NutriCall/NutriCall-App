import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nutri_call_app/features/progress/domain/entities/weight_progress_model.dart';
import 'package:nutri_call_app/features/progress/widget/area_chart_widget.dart';
import 'package:nutri_call_app/features/progress/widget/circular_percent_widget.dart';
import 'package:nutri_call_app/features/progress/widget/line_percent_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/features/progress/controllers/nutrition_progress_controller.dart';
import 'package:nutri_call_app/features/progress/controllers/weight_progress_controller.dart';

class ProgressPage extends HookConsumerWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutritionProgressAsync =
        ref.watch(fetchNutritionProgressNotifierProvider);
    final weightProgressAsync = ref.watch(fetchWeightProgressNotifierProvider);
    final customChartData = generateChartData(
        weightProgressAsync.valueOrNull ?? const Left("Error"));

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchNutritionProgressNotifierProvider.notifier).fetch();
        ref.read(fetchWeightProgressNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(fetchNutritionProgressNotifierProvider.notifier).fetch();
        ref.read(fetchWeightProgressNotifierProvider.notifier).fetch();
      },
      color: AppColor.semiBlack,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Progress',
        ),
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
                  child: Row(
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
                                  nutritionProgressAsync.when(
                                    data: (nutritionProgress) {
                                      double totalEnergy =
                                          nutritionProgress.fold(
                                        (error) => 0.0,
                                        (nutritionProgressModel) =>
                                            nutritionProgressModel
                                                .totalEnergy ??
                                            0.0,
                                      );
                                      return RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.poppins(
                                            color: AppColor.semiBlack,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: '$totalEnergy ',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'kcal',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    loading: () {
                                      return const CircularProgressIndicator();
                                    },
                                    error: (error, stackTrace) {
                                      return Text('Error: $error');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Gap(12),
                            nutritionProgressAsync.when(
                              data: (data) {
                                double totalCarbs = double.parse(data
                                    .fold(
                                      (error) => 0.0,
                                      (nutritionProgressModel) =>
                                          nutritionProgressModel.totalCarbs ??
                                          0.0,
                                    )
                                    .toStringAsFixed(2));
                                double totalFat = double.parse(data
                                    .fold(
                                      (error) => 0.0,
                                      (nutritionProgressModel) =>
                                          nutritionProgressModel.totalFat ??
                                          0.0,
                                    )
                                    .toStringAsFixed(2));
                                double totalProtein = double.parse(data
                                    .fold(
                                      (error) => 0.0,
                                      (nutritionProgressModel) =>
                                          nutritionProgressModel
                                              .totalProteins ??
                                          0.0,
                                    )
                                    .toStringAsFixed(2));
                                double dailyCarbs = double.parse(data
                                    .fold(
                                      (error) => 0.0,
                                      (nutritionProgressModel) =>
                                          nutritionProgressModel.dailyCarbs ??
                                          0.0,
                                    )
                                    .toStringAsFixed(2));
                                double dailyFat = double.parse(data
                                    .fold(
                                      (error) => 0.0,
                                      (nutritionProgressModel) =>
                                          nutritionProgressModel.dailyFat ??
                                          0.0,
                                    )
                                    .toStringAsFixed(2));
                                double dailyProtein = double.parse(data
                                    .fold(
                                      (error) => 0.0,
                                      (nutritionProgressModel) =>
                                          nutritionProgressModel
                                              .dailyProteins ??
                                          0.0,
                                    )
                                    .toStringAsFixed(2));
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: LinePercentWidget(
                                        title: 'Carbs',
                                        percent: totalCarbs / dailyCarbs,
                                        progressColor: AppColor.blue,
                                        valueText:
                                            '$totalCarbs / $dailyCarbs g',
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: LinePercentWidget(
                                        title: 'Protein',
                                        percent: totalProtein / dailyProtein,
                                        progressColor: AppColor.orange,
                                        valueText:
                                            '$totalProtein / $dailyProtein g',
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: LinePercentWidget(
                                        title: 'Fat',
                                        percent: totalFat / dailyFat,
                                        progressColor: AppColor.pink,
                                        valueText: '$totalFat / $dailyFat g',
                                      ),
                                    ),
                                  ],
                                );
                              },
                              loading: () => const CircularProgressIndicator(),
                              error: (error, stackTrace) =>
                                  Text('Error: $error'),
                            ),
                          ],
                        ),
                      ),
                      nutritionProgressAsync.when(
                        data: (nutritionProgress) {
                          int differenceEnergy = nutritionProgress
                              .fold(
                                (error) => 0.0,
                                (nutritionProgressModel) =>
                                    nutritionProgressModel.differenceEnergy ??
                                    0.0,
                              )
                              .toInt();
                          double percentageEnergy = nutritionProgress.fold(
                            (error) => 0.0,
                            (nutritionProgressModel) =>
                                nutritionProgressModel.percentageEnergy ?? 0.0,
                          );
                          return Expanded(
                            flex: 2,
                            child: CircularPercentWidget(
                              percent: percentageEnergy / 100,
                              progressColor: AppColor.darkGreen,
                              backgroundColor: AppColor.disabledGreen,
                              value1: '$differenceEnergy',
                              value2: 'kcal remaining',
                            ),
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stackTrace) => Text('Error: $error'),
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
                  child: Row(
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
                                weightProgressAsync.when(
                                  data: (weightProgress) {
                                    int weight = weightProgress.fold(
                                      (error) => 0,
                                      (weightProgressModel) =>
                                          (weightProgressModel.weight ?? 0.0)
                                              .toInt(),
                                    );
                                    int weightTarget = weightProgress.fold(
                                      (error) => 0,
                                      (weightProgressModel) =>
                                          (weightProgressModel.weightTarget ??
                                                  0.0)
                                              .toInt(),
                                    );
                                    return RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.poppins(
                                          color: AppColor.semiBlack,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$weight /',
                                            style: GoogleFonts.poppins(
                                                color: AppColor.semiBlack,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                          TextSpan(
                                            text: ' $weightTarget kg',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: AppColor.lightBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  loading: () {
                                    return const CircularProgressIndicator();
                                  },
                                  error: (error, stackTrace) {
                                    return Text('Error: $error');
                                  },
                                ),
                              ],
                            ),
                            const Gap(36),
                            Text(
                              DateFormat("d MMMM y", "id")
                                  .format(DateTime.now()),
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

  List<ChartData> generateChartData(
      Either<String, WeightProgressModel> weightProgress) {
    return weightProgress.fold(
      (error) => [],
      (weightModel) {
        final traffic = weightModel.traffic ?? [];
        return traffic.map((entry) {
          final parsedDate =
              DateTime.tryParse(entry.date.toString()) ?? DateTime.now();
          final formattedDate = DateFormat('dd/MM').format(parsedDate);
          return ChartData(formattedDate, entry.weight);
        }).toList();
      },
    );
  }
}
