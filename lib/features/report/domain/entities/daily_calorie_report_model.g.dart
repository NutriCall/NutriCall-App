// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_calorie_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyCalorieReportModelImpl _$$DailyCalorieReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyCalorieReportModelImpl(
      goal: (json['goal'] as num?)?.toDouble(),
      totalCalToday: (json['total_cal_today'] as num?)?.toDouble(),
      todayCalories: (json['today_calories'] as List<dynamic>?)
          ?.map(
              (e) => TodayCaloriesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      average: (json['average'] as num?)?.toDouble(),
      graph: (json['graph'] as List<dynamic>?)
          ?.map((e) => GraphCaloriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DailyCalorieReportModelImplToJson(
        _$DailyCalorieReportModelImpl instance) =>
    <String, dynamic>{
      'goal': instance.goal,
      'total_cal_today': instance.totalCalToday,
      'today_calories': instance.todayCalories,
      'average': instance.average,
      'graph': instance.graph,
    };

_$TodayCaloriesItemModelImpl _$$TodayCaloriesItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayCaloriesItemModelImpl(
      type: json['type'] as String?,
      calories: (json['calories'] as num?)?.toDouble(),
      percentage: (json['percentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TodayCaloriesItemModelImplToJson(
        _$TodayCaloriesItemModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'calories': instance.calories,
      'percentage': instance.percentage,
    };

_$GraphCaloriesModelImpl _$$GraphCaloriesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GraphCaloriesModelImpl(
      date: json['date'] as String?,
      breakfast: (json['Breakfast'] as num?)?.toDouble(),
      lunch: (json['Lunch'] as num?)?.toDouble(),
      dinner: (json['Dinner'] as num?)?.toDouble(),
      snacksOther: (json['Snacks/Other'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GraphCaloriesModelImplToJson(
        _$GraphCaloriesModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'Breakfast': instance.breakfast,
      'Lunch': instance.lunch,
      'Dinner': instance.dinner,
      'Snacks/Other': instance.snacksOther,
    };
