// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_calorie_report_model.freezed.dart';
part 'daily_calorie_report_model.g.dart';

@freezed
class DailyCalorieReportModel with _$DailyCalorieReportModel {
  const factory DailyCalorieReportModel({
    @JsonKey(name: 'goal') double? goal,
    @JsonKey(name: 'total_cal_today') double? totalCalToday,
    @JsonKey(name: 'today_calories')
    List<TodayCaloriesItemModel>? todayCalories,
    @JsonKey(name: 'average') double? average,
    @JsonKey(name: 'graph') List<GraphCaloriesModel>? graph,
  }) = _DailyCalorieReportModel;

  factory DailyCalorieReportModel.fromJson(Map<String, dynamic> json) =>
      _$DailyCalorieReportModelFromJson(json);
}

@freezed
class TodayCaloriesItemModel with _$TodayCaloriesItemModel {
  const factory TodayCaloriesItemModel({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'calories') double? calories,
    @JsonKey(name: 'percentage') double? percentage,
  }) = _TodayCaloriesItemModel;

  factory TodayCaloriesItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodayCaloriesItemModelFromJson(json);
}

@freezed
class GraphCaloriesModel with _$GraphCaloriesModel {
  const factory GraphCaloriesModel({
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'Breakfast') double? breakfast,
    @JsonKey(name: 'Lunch') double? lunch,
    @JsonKey(name: 'Dinner') double? dinner,
    @JsonKey(name: 'Snacks/Other') double? snacksOther,
  }) = _GraphCaloriesModel;

  factory GraphCaloriesModel.fromJson(Map<String, dynamic> json) =>
      _$GraphCaloriesModelFromJson(json);
}
