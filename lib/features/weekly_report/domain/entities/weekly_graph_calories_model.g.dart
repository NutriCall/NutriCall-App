// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_graph_calories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyGraphCaloriesModelImpl _$$WeeklyGraphCaloriesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyGraphCaloriesModelImpl(
      graph: (json['graph'] as List<dynamic>?)
          ?.map((e) => GraphCaloriesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeeklyGraphCaloriesModelImplToJson(
        _$WeeklyGraphCaloriesModelImpl instance) =>
    <String, dynamic>{
      'graph': instance.graph,
    };

_$GraphCaloriesItemImpl _$$GraphCaloriesItemImplFromJson(
        Map<String, dynamic> json) =>
    _$GraphCaloriesItemImpl(
      date: json['date'] as String,
      totalEnergy: (json['total_energy'] as num?)?.toDouble(),
      percentageOfGoal: (json['percentage_of_goal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GraphCaloriesItemImplToJson(
        _$GraphCaloriesItemImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total_energy': instance.totalEnergy,
      'percentage_of_goal': instance.percentageOfGoal,
    };
