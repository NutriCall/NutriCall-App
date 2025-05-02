// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macronutrient_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MacronutrientReportModelImpl _$$MacronutrientReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MacronutrientReportModelImpl(
      graph: (json['graph'] as List<dynamic>?)
          ?.map((e) =>
              MacronutrientGraphModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      todayMacro: json['today_macro'] == null
          ? null
          : TodayMacronutrientModel.fromJson(
              json['today_macro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MacronutrientReportModelImplToJson(
        _$MacronutrientReportModelImpl instance) =>
    <String, dynamic>{
      'graph': instance.graph,
      'today_macro': instance.todayMacro,
    };

_$MacronutrientGraphModelImpl _$$MacronutrientGraphModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MacronutrientGraphModelImpl(
      date: json['date'] as String?,
      carbs: (json['carbs'] as num?)?.toDouble(),
      proteins: (json['proteins'] as num?)?.toDouble(),
      fats: (json['fats'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MacronutrientGraphModelImplToJson(
        _$MacronutrientGraphModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'carbs': instance.carbs,
      'proteins': instance.proteins,
      'fats': instance.fats,
    };

_$TodayMacronutrientModelImpl _$$TodayMacronutrientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayMacronutrientModelImpl(
      carbs: json['carbs'] == null
          ? null
          : MacroDetailModel.fromJson(json['carbs'] as Map<String, dynamic>),
      proteins: json['proteins'] == null
          ? null
          : MacroDetailModel.fromJson(json['proteins'] as Map<String, dynamic>),
      fats: json['fats'] == null
          ? null
          : MacroDetailModel.fromJson(json['fats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TodayMacronutrientModelImplToJson(
        _$TodayMacronutrientModelImpl instance) =>
    <String, dynamic>{
      'carbs': instance.carbs,
      'proteins': instance.proteins,
      'fats': instance.fats,
    };

_$MacroDetailModelImpl _$$MacroDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MacroDetailModelImpl(
      value: (json['value'] as num?)?.toDouble(),
      percentage: (json['percentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MacroDetailModelImplToJson(
        _$MacroDetailModelImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'percentage': instance.percentage,
    };
