// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_calories_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyCaloriesReportModelImpl _$$WeeklyCaloriesReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyCaloriesReportModelImpl(
      weeklyGoal: (json['weekly_goal'] as num?)?.toDouble(),
      weeklyConsumed: (json['weekly_consumed'] as num?)?.toDouble(),
      difference: (json['difference'] as num).toDouble(),
    );

Map<String, dynamic> _$$WeeklyCaloriesReportModelImplToJson(
        _$WeeklyCaloriesReportModelImpl instance) =>
    <String, dynamic>{
      'weekly_goal': instance.weeklyGoal,
      'weekly_consumed': instance.weeklyConsumed,
      'difference': instance.difference,
    };
