// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_plan_model.freezed.dart';
part 'meal_plan_model.g.dart';

@freezed
class MealPlanModel with _$MealPlanModel {
  const factory MealPlanModel({
    required String type,
    required List<Meal> meals,
    @JsonKey(name: 'total_energi') required double totalEnergi,
  }) = _MealPlanModel;

  factory MealPlanModel.fromJson(Map<String, dynamic> json) =>
      _$MealPlanModelFromJson(json);
}

@freezed
class Meal with _$Meal {
  const factory Meal({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'composition_id') required int compositionId,
    required String date,
    required String type,
    @JsonKey(name: 'food_composition') required FoodComposition foodComposition,
  }) = _Meal;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}

@freezed
class FoodComposition with _$FoodComposition {
  const factory FoodComposition({
    @JsonKey(name: 'nama_bahan') required String namaBahan,
    required double energi,
    required double karbohidrat,
    required double protein,
    required double lemak,
  }) = _FoodComposition;

  factory FoodComposition.fromJson(Map<String, dynamic> json) =>
      _$FoodCompositionFromJson(json);
}
