// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_ingredients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListIngredientsModelImpl _$$ListIngredientsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListIngredientsModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      compositionId: (json['composition_id'] as num).toInt(),
      date: json['date'] as String,
      type: json['type'] as String,
      namaBahan: json['nama_bahan'] as String,
      energi: (json['energi'] as num).toDouble(),
    );

Map<String, dynamic> _$$ListIngredientsModelImplToJson(
        _$ListIngredientsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'composition_id': instance.compositionId,
      'date': instance.date,
      'type': instance.type,
      'nama_bahan': instance.namaBahan,
      'energi': instance.energi,
    };
