// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_recipe_model.freezed.dart';
part 'detail_recipe_model.g.dart';

@freezed
class DetailRecipeModel with _$DetailRecipeModel {
  const factory DetailRecipeModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "composition_id") int? compositionId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "sumber") String? sumber,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "date") String? date,
    @JsonKey(name: "energi") int? energi,
    @JsonKey(name: "protein") double? protein,
    @JsonKey(name: "lemak") double? lemak,
    @JsonKey(name: "karbohidrat") int? karbohidrat,
    @JsonKey(name: "ingredients") List<IngredientModel>? ingredients,
    @JsonKey(name: "steps") List<String>? steps,
  }) = _DetailRecipeModel;

  factory DetailRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$DetailRecipeModelFromJson(json);
}

@freezed
class IngredientModel with _$IngredientModel {
  const factory IngredientModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "nama_bahan") String? namaBahan,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
}
