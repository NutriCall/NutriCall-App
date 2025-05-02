// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_progress_model.freezed.dart';
part 'nutrition_progress_model.g.dart';

@freezed
class NutritionProgressModel with _$NutritionProgressModel {
  const factory NutritionProgressModel({
    @JsonKey(name: "goal") double? goal,
    @JsonKey(name: "daily_carbs") double? dailyCarbs,
    @JsonKey(name: "daily_fat") double? dailyFat,
    @JsonKey(name: "daily_proteins") double? dailyProteins,
    @JsonKey(name: "total_energy") double? totalEnergy,
    @JsonKey(name: "total_carbs") double? totalCarbs,
    @JsonKey(name: "total_fat") double? totalFat,
    @JsonKey(name: "total_proteins") double? totalProteins,
    @JsonKey(name: "difference_energy") double? differenceEnergy,
    @JsonKey(name: "percentage_energy") double? percentageEnergy,
  }) = _NutritionProgressModel;

  factory NutritionProgressModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionProgressModelFromJson(json);
}
