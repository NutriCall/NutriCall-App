// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'macronutrient_report_model.freezed.dart';
part 'macronutrient_report_model.g.dart';

@freezed
class MacronutrientReportModel with _$MacronutrientReportModel {
  const factory MacronutrientReportModel({
    @JsonKey(name: 'graph') List<MacronutrientGraphModel>? graph,
    @JsonKey(name: 'today_macro') TodayMacronutrientModel? todayMacro,
  }) = _MacronutrientReportModel;

  factory MacronutrientReportModel.fromJson(Map<String, dynamic> json) =>
      _$MacronutrientReportModelFromJson(json);
}

@freezed
class MacronutrientGraphModel with _$MacronutrientGraphModel {
  const factory MacronutrientGraphModel({
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'carbs') double? carbs,
    @JsonKey(name: 'proteins') double? proteins,
    @JsonKey(name: 'fats') double? fats,
  }) = _MacronutrientGraphModel;

  factory MacronutrientGraphModel.fromJson(Map<String, dynamic> json) =>
      _$MacronutrientGraphModelFromJson(json);
}

@freezed
class TodayMacronutrientModel with _$TodayMacronutrientModel {
  const factory TodayMacronutrientModel({
    @JsonKey(name: 'carbs') MacroDetailModel? carbs,
    @JsonKey(name: 'proteins') MacroDetailModel? proteins,
    @JsonKey(name: 'fats') MacroDetailModel? fats,
  }) = _TodayMacronutrientModel;

  factory TodayMacronutrientModel.fromJson(Map<String, dynamic> json) =>
      _$TodayMacronutrientModelFromJson(json);
}

@freezed
class MacroDetailModel with _$MacroDetailModel {
  const factory MacroDetailModel({
    @JsonKey(name: 'value') double? value,
    @JsonKey(name: 'percentage') double? percentage,
  }) = _MacroDetailModel;

  factory MacroDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MacroDetailModelFromJson(json);
}
