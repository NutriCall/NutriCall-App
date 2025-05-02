import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_model.freezed.dart';
part 'nutrient_model.g.dart';

@freezed
class NutrientItemModel with _$NutrientItemModel {
  const factory NutrientItemModel({
    required String name,
    required double consumed,
    @Default(null) dynamic goal,
    @Default(null) dynamic difference,
  }) = _NutrientItemModel;

  factory NutrientItemModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientItemModelFromJson(json);
}
