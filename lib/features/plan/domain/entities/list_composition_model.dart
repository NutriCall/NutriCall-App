// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_composition_model.freezed.dart';
part 'list_composition_model.g.dart';

@freezed
class ListCompositionModel with _$ListCompositionModel {
  const factory ListCompositionModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "nama_bahan") String? namaBahan,
  }) = _ListCompositionModel;

  factory ListCompositionModel.fromJson(Map<String, dynamic> json) =>
      _$ListCompositionModelFromJson(json);
}
