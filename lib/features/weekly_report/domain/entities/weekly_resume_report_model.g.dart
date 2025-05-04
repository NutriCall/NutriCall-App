// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_resume_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyResumeReportModelImpl _$$WeeklyResumeReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyResumeReportModelImpl(
      totalAll: (json['total_all'] as num?)?.toDouble(),
      nutrientPercentage: _filterNonZeroMap(
          json['nutrient_percentage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeeklyResumeReportModelImplToJson(
        _$WeeklyResumeReportModelImpl instance) =>
    <String, dynamic>{
      'total_all': instance.totalAll,
      'nutrient_percentage': instance.nutrientPercentage,
    };
