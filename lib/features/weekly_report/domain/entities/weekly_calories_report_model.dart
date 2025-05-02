import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_calories_report_model.freezed.dart';
part 'weekly_calories_report_model.g.dart';

@freezed
class WeeklyCaloriesReportModel with _$WeeklyCaloriesReportModel {
  const factory WeeklyCaloriesReportModel({
    @JsonKey(name: 'weekly_goal') required double weeklyGoal,
    @JsonKey(name: 'weekly_consumed') required double weeklyConsumed,
    required double difference,
  }) = _WeeklyCaloriesReportModel;

  factory WeeklyCaloriesReportModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyCaloriesReportModelFromJson(json);
}
