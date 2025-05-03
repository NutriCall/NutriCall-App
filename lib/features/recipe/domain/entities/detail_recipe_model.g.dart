// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailRecipeModelImpl _$$DetailRecipeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailRecipeModelImpl(
      id: (json['id'] as num?)?.toInt(),
      compositionId: (json['composition_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      title: json['title'] as String?,
      sumber: json['sumber'] as String?,
      imageUrl: json['image_url'] as String?,
      date: json['date'] as String?,
      energi: (json['energi'] as num?)?.toInt(),
      protein: (json['protein'] as num?)?.toDouble(),
      lemak: (json['lemak'] as num?)?.toDouble(),
      karbohidrat: (json['karbohidrat'] as num?)?.toInt(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps:
          (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DetailRecipeModelImplToJson(
        _$DetailRecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'composition_id': instance.compositionId,
      'name': instance.name,
      'title': instance.title,
      'sumber': instance.sumber,
      'image_url': instance.imageUrl,
      'date': instance.date,
      'energi': instance.energi,
      'protein': instance.protein,
      'lemak': instance.lemak,
      'karbohidrat': instance.karbohidrat,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
    };

_$IngredientModelImpl _$$IngredientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientModelImpl(
      id: (json['id'] as num?)?.toInt(),
      namaBahan: json['nama_bahan'] as String?,
    );

Map<String, dynamic> _$$IngredientModelImplToJson(
        _$IngredientModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_bahan': instance.namaBahan,
    };
