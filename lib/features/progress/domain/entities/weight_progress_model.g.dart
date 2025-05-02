// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightTrafficModelImpl _$$WeightTrafficModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeightTrafficModelImpl(
      date: DateTime.parse(json['date'] as String),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeightTrafficModelImplToJson(
        _$WeightTrafficModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'weight': instance.weight,
    };

_$WeightProgressModelImpl _$$WeightProgressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeightProgressModelImpl(
      weight: (json['weight'] as num?)?.toDouble(),
      weightTarget: (json['weight_target'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      traffic: (json['traffic'] as List<dynamic>?)
          ?.map((e) => WeightTrafficModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeightProgressModelImplToJson(
        _$WeightProgressModelImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'weight_target': instance.weightTarget,
      'date': instance.date?.toIso8601String(),
      'traffic': instance.traffic,
    };
