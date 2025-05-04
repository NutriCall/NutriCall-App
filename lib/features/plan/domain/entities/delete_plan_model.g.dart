// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeletePlanModelImpl _$$DeletePlanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeletePlanModelImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      compositionId: (json['composition_id'] as num?)?.toInt(),
      date: json['date'] as String?,
      type: json['type'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DeletePlanModelImplToJson(
        _$DeletePlanModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'composition_id': instance.compositionId,
      'date': instance.date,
      'type': instance.type,
      'id': instance.id,
    };
