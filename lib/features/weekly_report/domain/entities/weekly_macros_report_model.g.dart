// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_macros_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyMacrosReportModelImpl _$$WeeklyMacrosReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyMacrosReportModelImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => MacroItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeeklyMacrosReportModelImplToJson(
        _$WeeklyMacrosReportModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$MacroItemImpl _$$MacroItemImplFromJson(Map<String, dynamic> json) =>
    _$MacroItemImpl(
      name: json['name'] as String,
      total: (json['total'] as num).toDouble(),
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$MacroItemImplToJson(_$MacroItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
      'percentage': instance.percentage,
    };
