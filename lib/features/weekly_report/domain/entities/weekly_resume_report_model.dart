// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_resume_report_model.freezed.dart';
part 'weekly_resume_report_model.g.dart';

@freezed
class WeeklyResumeReportModel with _$WeeklyResumeReportModel {
  const factory WeeklyResumeReportModel({
    @JsonKey(name: 'total_all') double? totalAll,
    @JsonKey(
      name: 'nutrient_percentage',
      fromJson: _filterNonZeroMap,
    )
    Map<String, double>? nutrientPercentage,
  }) = _WeeklyResumeReportModel;

  factory WeeklyResumeReportModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyResumeReportModelFromJson(json);
}

Map<String, double> _filterNonZeroMap(Map<String, dynamic> rawMap) {
  final filteredMap = <String, double>{};
  for (var entry in rawMap.entries) {
    final value = (entry.value is int)
        ? (entry.value as int).toDouble()
        : (entry.value as num).toDouble();
    if (value > 0) {
      filteredMap[entry.key] = value;
    }
  }
  return filteredMap;
}
