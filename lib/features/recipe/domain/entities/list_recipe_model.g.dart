// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListRecipeModelImpl _$$ListRecipeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ListRecipeModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      date: json['date'] as String?,
      imageUrl: json['image_url'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      userFullName: json['user_full_name'] as String?,
      userImage: json['user_image'] as String?,
    );

Map<String, dynamic> _$$ListRecipeModelImplToJson(
        _$ListRecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'image_url': instance.imageUrl,
      'user_id': instance.userId,
      'user_full_name': instance.userFullName,
      'user_image': instance.userImage,
    };
