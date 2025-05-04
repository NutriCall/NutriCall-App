// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeletePlanModel _$DeletePlanModelFromJson(Map<String, dynamic> json) {
  return _DeletePlanModel.fromJson(json);
}

/// @nodoc
mixin _$DeletePlanModel {
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "composition_id")
  int? get compositionId => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this DeletePlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeletePlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeletePlanModelCopyWith<DeletePlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletePlanModelCopyWith<$Res> {
  factory $DeletePlanModelCopyWith(
          DeletePlanModel value, $Res Function(DeletePlanModel) then) =
      _$DeletePlanModelCopyWithImpl<$Res, DeletePlanModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "composition_id") int? compositionId,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "id") int? id});
}

/// @nodoc
class _$DeletePlanModelCopyWithImpl<$Res, $Val extends DeletePlanModel>
    implements $DeletePlanModelCopyWith<$Res> {
  _$DeletePlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeletePlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? compositionId = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      compositionId: freezed == compositionId
          ? _value.compositionId
          : compositionId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeletePlanModelImplCopyWith<$Res>
    implements $DeletePlanModelCopyWith<$Res> {
  factory _$$DeletePlanModelImplCopyWith(_$DeletePlanModelImpl value,
          $Res Function(_$DeletePlanModelImpl) then) =
      __$$DeletePlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_id") int? userId,
      @JsonKey(name: "composition_id") int? compositionId,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "id") int? id});
}

/// @nodoc
class __$$DeletePlanModelImplCopyWithImpl<$Res>
    extends _$DeletePlanModelCopyWithImpl<$Res, _$DeletePlanModelImpl>
    implements _$$DeletePlanModelImplCopyWith<$Res> {
  __$$DeletePlanModelImplCopyWithImpl(
      _$DeletePlanModelImpl _value, $Res Function(_$DeletePlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeletePlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? compositionId = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? id = freezed,
  }) {
    return _then(_$DeletePlanModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      compositionId: freezed == compositionId
          ? _value.compositionId
          : compositionId // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeletePlanModelImpl implements _DeletePlanModel {
  const _$DeletePlanModelImpl(
      {@JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "composition_id") this.compositionId,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "id") this.id});

  factory _$DeletePlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeletePlanModelImplFromJson(json);

  @override
  @JsonKey(name: "user_id")
  final int? userId;
  @override
  @JsonKey(name: "composition_id")
  final int? compositionId;
  @override
  @JsonKey(name: "date")
  final String? date;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "id")
  final int? id;

  @override
  String toString() {
    return 'DeletePlanModel(userId: $userId, compositionId: $compositionId, date: $date, type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePlanModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.compositionId, compositionId) ||
                other.compositionId == compositionId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, compositionId, date, type, id);

  /// Create a copy of DeletePlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePlanModelImplCopyWith<_$DeletePlanModelImpl> get copyWith =>
      __$$DeletePlanModelImplCopyWithImpl<_$DeletePlanModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeletePlanModelImplToJson(
      this,
    );
  }
}

abstract class _DeletePlanModel implements DeletePlanModel {
  const factory _DeletePlanModel(
      {@JsonKey(name: "user_id") final int? userId,
      @JsonKey(name: "composition_id") final int? compositionId,
      @JsonKey(name: "date") final String? date,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "id") final int? id}) = _$DeletePlanModelImpl;

  factory _DeletePlanModel.fromJson(Map<String, dynamic> json) =
      _$DeletePlanModelImpl.fromJson;

  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(name: "composition_id")
  int? get compositionId;
  @override
  @JsonKey(name: "date")
  String? get date;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "id")
  int? get id;

  /// Create a copy of DeletePlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletePlanModelImplCopyWith<_$DeletePlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
