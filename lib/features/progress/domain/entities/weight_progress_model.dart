// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_progress_model.freezed.dart';
part 'weight_progress_model.g.dart';

@freezed
class WeightTrafficModel with _$WeightTrafficModel {
  const factory WeightTrafficModel({
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "weight") required double weight,
  }) = _WeightTrafficModel;

  factory WeightTrafficModel.fromJson(Map<String, dynamic> json) =>
      _$WeightTrafficModelFromJson(json);
}

@freezed
class WeightProgressModel with _$WeightProgressModel {
  const factory WeightProgressModel({
    @JsonKey(name: "weight") double? weight,
    @JsonKey(name: "weight_target") double? weightTarget,
    @JsonKey(name: "date") DateTime? date,
    @JsonKey(name: "traffic") List<WeightTrafficModel>? traffic,
  }) = _WeightProgressModel;

  factory WeightProgressModel.fromJson(Map<String, dynamic> json) =>
      _$WeightProgressModelFromJson(json);
}
