// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_eaten_report_model.freezed.dart';
part 'food_eaten_report_model.g.dart';

@freezed
class FoodEatenReportModel with _$FoodEatenReportModel {
  const factory FoodEatenReportModel({
    @JsonKey(name: 'items') List<FoodItemModel>? items,
    @JsonKey(name: 'total') FoodEatenTotalModel? total,
  }) = _FoodEatenReportModel;

  factory FoodEatenReportModel.fromJson(Map<String, dynamic> json) =>
      _$FoodEatenReportModelFromJson(json);
}

@freezed
class FoodItemModel with _$FoodItemModel {
  const factory FoodItemModel({
    @JsonKey(name: 'nama_bahan') String? name,
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'total_calories') double? calories,
    @JsonKey(name: 'total_fats') double? fats,
    @JsonKey(name: 'total_carbs') double? carbs,
    @JsonKey(name: 'total_proteins') double? proteins,
  }) = _FoodItemModel;

  factory FoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$FoodItemModelFromJson(json);
}

@freezed
class FoodEatenTotalModel with _$FoodEatenTotalModel {
  const factory FoodEatenTotalModel({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'total_calories') double? totalCalories,
    @JsonKey(name: 'total_fats') double? totalFats,
    @JsonKey(name: 'total_carbs') double? totalCarbs,
    @JsonKey(name: 'total_proteins') double? totalProteins,
  }) = _FoodEatenTotalModel;

  factory FoodEatenTotalModel.fromJson(Map<String, dynamic> json) =>
      _$FoodEatenTotalModelFromJson(json);
}
