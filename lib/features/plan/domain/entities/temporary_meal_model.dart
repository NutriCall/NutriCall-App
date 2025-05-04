// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'temporary_meal_model.freezed.dart';
part 'temporary_meal_model.g.dart';

@freezed
class TemporaryMealModel with _$TemporaryMealModel {
  const factory TemporaryMealModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "user_id") required int userId,
    @JsonKey(name: "composition_id") required int compositionId,
    @JsonKey(name: "date") required String date,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "nama_bahan") required String namaBahan,
    @JsonKey(name: "energi") required double energi,
  }) = _TemporaryMealModel;

  factory TemporaryMealModel.fromJson(Map<String, dynamic> json) =>
      _$TemporaryMealModelFromJson(json);
}
