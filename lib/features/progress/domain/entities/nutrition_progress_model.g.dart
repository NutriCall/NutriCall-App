// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutritionProgressModelImpl _$$NutritionProgressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NutritionProgressModelImpl(
      goal: (json['goal'] as num?)?.toDouble(),
      dailyCarbs: (json['daily_carbs'] as num?)?.toDouble(),
      dailyFat: (json['daily_fat'] as num?)?.toDouble(),
      dailyProteins: (json['daily_proteins'] as num?)?.toDouble(),
      totalEnergy: (json['total_energy'] as num?)?.toDouble(),
      totalCarbs: (json['total_carbs'] as num?)?.toDouble(),
      totalFat: (json['total_fat'] as num?)?.toDouble(),
      totalProteins: (json['total_proteins'] as num?)?.toDouble(),
      differenceEnergy: (json['difference_energy'] as num?)?.toDouble(),
      percentageEnergy: (json['percentage_energy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$NutritionProgressModelImplToJson(
        _$NutritionProgressModelImpl instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'daily_carbs': instance.dailyCarbs,
      'daily_fat': instance.dailyFat,
      'daily_proteins': instance.dailyProteins,
      'total_energy': instance.totalEnergy,
      'total_carbs': instance.totalCarbs,
      'total_fat': instance.totalFat,
      'total_proteins': instance.totalProteins,
      'difference_energy': instance.differenceEnergy,
      'percentage_energy': instance.percentageEnergy,
    };
