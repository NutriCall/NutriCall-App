// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealPlanModelImpl _$$MealPlanModelImplFromJson(Map<String, dynamic> json) =>
    _$MealPlanModelImpl(
      type: json['type'] as String,
      meals: (json['meals'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEnergi: (json['total_energi'] as num).toDouble(),
    );

Map<String, dynamic> _$$MealPlanModelImplToJson(_$MealPlanModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'meals': instance.meals,
      'total_energi': instance.totalEnergi,
    };

_$MealImpl _$$MealImplFromJson(Map<String, dynamic> json) => _$MealImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      compositionId: (json['composition_id'] as num).toInt(),
      date: json['date'] as String,
      type: json['type'] as String,
      foodComposition: FoodComposition.fromJson(
          json['food_composition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MealImplToJson(_$MealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'composition_id': instance.compositionId,
      'date': instance.date,
      'type': instance.type,
      'food_composition': instance.foodComposition,
    };

_$FoodCompositionImpl _$$FoodCompositionImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodCompositionImpl(
      namaBahan: json['nama_bahan'] as String,
      energi: (json['energi'] as num).toDouble(),
      karbohidrat: (json['karbohidrat'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      lemak: (json['lemak'] as num).toDouble(),
    );

Map<String, dynamic> _$$FoodCompositionImplToJson(
        _$FoodCompositionImpl instance) =>
    <String, dynamic>{
      'nama_bahan': instance.namaBahan,
      'energi': instance.energi,
      'karbohidrat': instance.karbohidrat,
      'protein': instance.protein,
      'lemak': instance.lemak,
    };
