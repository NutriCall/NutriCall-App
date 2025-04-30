// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
