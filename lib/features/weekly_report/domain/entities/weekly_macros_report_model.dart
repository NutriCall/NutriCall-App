import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_macros_report_model.freezed.dart';
part 'weekly_macros_report_model.g.dart';

@freezed
class WeeklyMacrosReportModel with _$WeeklyMacrosReportModel {
  const factory WeeklyMacrosReportModel({
    required List<MacroItem> items,
  }) = _WeeklyMacrosReportModel;

  factory WeeklyMacrosReportModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyMacrosReportModelFromJson(json);
}

@freezed
class MacroItem with _$MacroItem {
  const factory MacroItem({
    required String name,
    required double total,
    required double percentage,
  }) = _MacroItem;

  factory MacroItem.fromJson(Map<String, dynamic> json) =>
      _$MacroItemFromJson(json);
}
