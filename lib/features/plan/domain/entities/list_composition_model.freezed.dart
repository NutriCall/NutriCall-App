// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_composition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListCompositionModel _$ListCompositionModelFromJson(Map<String, dynamic> json) {
  return _ListCompositionModel.fromJson(json);
}

/// @nodoc
mixin _$ListCompositionModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "nama_bahan")
  String? get namaBahan => throw _privateConstructorUsedError;

  /// Serializes this ListCompositionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListCompositionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListCompositionModelCopyWith<ListCompositionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListCompositionModelCopyWith<$Res> {
  factory $ListCompositionModelCopyWith(ListCompositionModel value,
          $Res Function(ListCompositionModel) then) =
      _$ListCompositionModelCopyWithImpl<$Res, ListCompositionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "nama_bahan") String? namaBahan});
}

/// @nodoc
class _$ListCompositionModelCopyWithImpl<$Res,
        $Val extends ListCompositionModel>
    implements $ListCompositionModelCopyWith<$Res> {
  _$ListCompositionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListCompositionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namaBahan = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namaBahan: freezed == namaBahan
          ? _value.namaBahan
          : namaBahan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListCompositionModelImplCopyWith<$Res>
    implements $ListCompositionModelCopyWith<$Res> {
  factory _$$ListCompositionModelImplCopyWith(_$ListCompositionModelImpl value,
          $Res Function(_$ListCompositionModelImpl) then) =
      __$$ListCompositionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "nama_bahan") String? namaBahan});
}

/// @nodoc
class __$$ListCompositionModelImplCopyWithImpl<$Res>
    extends _$ListCompositionModelCopyWithImpl<$Res, _$ListCompositionModelImpl>
    implements _$$ListCompositionModelImplCopyWith<$Res> {
  __$$ListCompositionModelImplCopyWithImpl(_$ListCompositionModelImpl _value,
      $Res Function(_$ListCompositionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListCompositionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namaBahan = freezed,
  }) {
    return _then(_$ListCompositionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namaBahan: freezed == namaBahan
          ? _value.namaBahan
          : namaBahan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListCompositionModelImpl implements _ListCompositionModel {
  const _$ListCompositionModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "nama_bahan") this.namaBahan});

  factory _$ListCompositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListCompositionModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "nama_bahan")
  final String? namaBahan;

  @override
  String toString() {
    return 'ListCompositionModel(id: $id, namaBahan: $namaBahan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListCompositionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaBahan, namaBahan) ||
                other.namaBahan == namaBahan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaBahan);

  /// Create a copy of ListCompositionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListCompositionModelImplCopyWith<_$ListCompositionModelImpl>
      get copyWith =>
          __$$ListCompositionModelImplCopyWithImpl<_$ListCompositionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListCompositionModelImplToJson(
      this,
    );
  }
}

abstract class _ListCompositionModel implements ListCompositionModel {
  const factory _ListCompositionModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "nama_bahan") final String? namaBahan}) =
      _$ListCompositionModelImpl;

  factory _ListCompositionModel.fromJson(Map<String, dynamic> json) =
      _$ListCompositionModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "nama_bahan")
  String? get namaBahan;

  /// Create a copy of ListCompositionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListCompositionModelImplCopyWith<_$ListCompositionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
