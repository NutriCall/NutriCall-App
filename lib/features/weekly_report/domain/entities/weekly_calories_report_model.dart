// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_calories_report_model.freezed.dart';
part 'weekly_calories_report_model.g.dart';

@freezed
class WeeklyCaloriesReportModel with _$WeeklyCaloriesReportModel {
  const factory WeeklyCaloriesReportModel({
    @JsonKey(name: 'weekly_goal') double? weeklyGoal,
    @JsonKey(name: 'weekly_consumed') double? weeklyConsumed,
    required double difference,
  }) = _WeeklyCaloriesReportModel;

  factory WeeklyCaloriesReportModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyCaloriesReportModelFromJson(json);
}
