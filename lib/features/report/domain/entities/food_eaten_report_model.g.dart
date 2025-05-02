// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_eaten_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodEatenReportModelImpl _$$FoodEatenReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodEatenReportModelImpl(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FoodItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] == null
          ? null
          : FoodEatenTotalModel.fromJson(json['total'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FoodEatenReportModelImplToJson(
        _$FoodEatenReportModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
    };

_$FoodItemModelImpl _$$FoodItemModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodItemModelImpl(
      name: json['nama_bahan'] as String?,
      count: (json['count'] as num?)?.toInt(),
      calories: (json['total_calories'] as num?)?.toDouble(),
      fats: (json['total_fats'] as num?)?.toDouble(),
      carbs: (json['total_carbs'] as num?)?.toDouble(),
      proteins: (json['total_proteins'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FoodItemModelImplToJson(_$FoodItemModelImpl instance) =>
    <String, dynamic>{
      'nama_bahan': instance.name,
      'count': instance.count,
      'total_calories': instance.calories,
      'total_fats': instance.fats,
      'total_carbs': instance.carbs,
      'total_proteins': instance.proteins,
    };

_$FoodEatenTotalModelImpl _$$FoodEatenTotalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodEatenTotalModelImpl(
      count: (json['count'] as num?)?.toInt(),
      totalCalories: (json['total_calories'] as num?)?.toDouble(),
      totalFats: (json['total_fats'] as num?)?.toDouble(),
      totalCarbs: (json['total_carbs'] as num?)?.toDouble(),
      totalProteins: (json['total_proteins'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FoodEatenTotalModelImplToJson(
        _$FoodEatenTotalModelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'total_calories': instance.totalCalories,
      'total_fats': instance.totalFats,
      'total_carbs': instance.totalCarbs,
      'total_proteins': instance.totalProteins,
    };
