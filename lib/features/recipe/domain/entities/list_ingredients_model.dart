// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_ingredients_model.freezed.dart';
part 'list_ingredients_model.g.dart';

@freezed
class ListIngredientsModel with _$ListIngredientsModel {
  const factory ListIngredientsModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "user_id") required int userId,
    @JsonKey(name: "composition_id") required int compositionId,
    @JsonKey(name: "date") required String date,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "nama_bahan") required String namaBahan,
    @JsonKey(name: "energi") required double energi,
  }) = _ListIngredientsModel;

  factory ListIngredientsModel.fromJson(Map<String, dynamic> json) =>
      _$ListIngredientsModelFromJson(json);
}
