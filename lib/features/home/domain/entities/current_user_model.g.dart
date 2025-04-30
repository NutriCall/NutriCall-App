// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentUserModelImpl _$$CurrentUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentUserModelImpl(
      fullName: json['full_name'] as String?,
      username: json['username'] as String?,
      age: (json['age'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      weightTarget: (json['weight_target'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      bmi: (json['bmi'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
      fa: json['fa'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CurrentUserModelImplToJson(
        _$CurrentUserModelImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'username': instance.username,
      'age': instance.age,
      'weight': instance.weight,
      'weight_target': instance.weightTarget,
      'height': instance.height,
      'gender': instance.gender,
      'bmi': instance.bmi,
      'image_url': instance.imageUrl,
      'fa': instance.fa,
      'id': instance.id,
    };
