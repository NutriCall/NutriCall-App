// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cal_today_model.freezed.dart';
part 'cal_today_model.g.dart';

@freezed
class CalTodayModel with _$CalTodayModel {
  const factory CalTodayModel({
    @JsonKey(name: "calories") double? calories,
    @JsonKey(name: "goal") double? goal,
  }) = _CalTodayModel;

  factory CalTodayModel.fromJson(Map<String, dynamic> json) =>
      _$CalTodayModelFromJson(json);
}
