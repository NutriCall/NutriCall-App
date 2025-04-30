// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user_model.freezed.dart';
part 'current_user_model.g.dart';

@freezed
class CurrentUserModel with _$CurrentUserModel {
  const factory CurrentUserModel({
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "age") int? age,
    @JsonKey(name: "weight") int? weight,
    @JsonKey(name: "weight_target") int? weightTarget,
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "gender") String? gender,
    @JsonKey(name: "bmi") double? bmi,
    @JsonKey(name: "image_url") String? imageUrl,
    @JsonKey(name: "fa") String? fa,
    @JsonKey(name: "id") int? id,
  }) = _CurrentUserModel;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserModelFromJson(json);
}
