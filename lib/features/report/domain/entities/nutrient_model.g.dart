// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientItemModelImpl _$$NutrientItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutrientItemModelImpl(
      name: json['name'] as String,
      consumed: (json['consumed'] as num).toDouble(),
      goal: json['goal'] ?? null,
      difference: json['difference'] ?? null,
    );

Map<String, dynamic> _$$NutrientItemModelImplToJson(
        _$NutrientItemModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'consumed': instance.consumed,
      'goal': instance.goal,
      'difference': instance.difference,
    };
