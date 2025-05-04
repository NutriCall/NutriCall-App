// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_graph_calories_model.freezed.dart';
part 'weekly_graph_calories_model.g.dart';

@freezed
class WeeklyGraphCaloriesModel with _$WeeklyGraphCaloriesModel {
  const factory WeeklyGraphCaloriesModel({
    @JsonKey(name: 'graph') List<GraphCaloriesItem>? graph,
  }) = _WeeklyGraphCaloriesModel;

  factory WeeklyGraphCaloriesModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyGraphCaloriesModelFromJson(json);
}

@freezed
class GraphCaloriesItem with _$GraphCaloriesItem {
  const factory GraphCaloriesItem({
    required String date,
    @JsonKey(name: 'total_energy') double? totalEnergy,
    @JsonKey(name: 'percentage_of_goal') double? percentageOfGoal,
  }) = _GraphCaloriesItem;

  factory GraphCaloriesItem.fromJson(Map<String, dynamic> json) =>
      _$GraphCaloriesItemFromJson(json);
}
