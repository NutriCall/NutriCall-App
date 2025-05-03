// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_recipe_model.freezed.dart';
part 'list_recipe_model.g.dart';

@freezed
class ListRecipeModel with _$ListRecipeModel {
  const factory ListRecipeModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "date") String? date,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "user_full_name") String? userFullName,
    @JsonKey(name: "user_image") String? userImage,
  }) = _ListRecipeModel;

  factory ListRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$ListRecipeModelFromJson(json);
}
