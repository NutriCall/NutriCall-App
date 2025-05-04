// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_plan_model.freezed.dart';
part 'delete_plan_model.g.dart';

@freezed
class DeletePlanModel with _$DeletePlanModel {
  const factory DeletePlanModel({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "composition_id") int? compositionId,
    @JsonKey(name: "date") String? date,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "id") int? id,
  }) = _DeletePlanModel;

  factory DeletePlanModel.fromJson(Map<String, dynamic> json) =>
      _$DeletePlanModelFromJson(json);
}
