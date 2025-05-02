// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutrientItemModel _$NutrientItemModelFromJson(Map<String, dynamic> json) {
  return _NutrientItemModel.fromJson(json);
}

/// @nodoc
mixin _$NutrientItemModel {
  String get name => throw _privateConstructorUsedError;
  double get consumed => throw _privateConstructorUsedError;
  dynamic get goal => throw _privateConstructorUsedError;
  dynamic get difference => throw _privateConstructorUsedError;

  /// Serializes this NutrientItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutrientItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientItemModelCopyWith<NutrientItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientItemModelCopyWith<$Res> {
  factory $NutrientItemModelCopyWith(
          NutrientItemModel value, $Res Function(NutrientItemModel) then) =
      _$NutrientItemModelCopyWithImpl<$Res, NutrientItemModel>;
  @useResult
  $Res call({String name, double consumed, dynamic goal, dynamic difference});
}

/// @nodoc
class _$NutrientItemModelCopyWithImpl<$Res, $Val extends NutrientItemModel>
    implements $NutrientItemModelCopyWith<$Res> {
  _$NutrientItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? consumed = null,
    Object? goal = freezed,
    Object? difference = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as double,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      difference: freezed == difference
          ? _value.difference
          : difference // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientItemModelImplCopyWith<$Res>
    implements $NutrientItemModelCopyWith<$Res> {
  factory _$$NutrientItemModelImplCopyWith(_$NutrientItemModelImpl value,
          $Res Function(_$NutrientItemModelImpl) then) =
      __$$NutrientItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double consumed, dynamic goal, dynamic difference});
}

/// @nodoc
class __$$NutrientItemModelImplCopyWithImpl<$Res>
    extends _$NutrientItemModelCopyWithImpl<$Res, _$NutrientItemModelImpl>
    implements _$$NutrientItemModelImplCopyWith<$Res> {
  __$$NutrientItemModelImplCopyWithImpl(_$NutrientItemModelImpl _value,
      $Res Function(_$NutrientItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? consumed = null,
    Object? goal = freezed,
    Object? difference = freezed,
  }) {
    return _then(_$NutrientItemModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as double,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      difference: freezed == difference
          ? _value.difference
          : difference // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutrientItemModelImpl implements _NutrientItemModel {
  const _$NutrientItemModelImpl(
      {required this.name,
      required this.consumed,
      this.goal = null,
      this.difference = null});

  factory _$NutrientItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientItemModelImplFromJson(json);

  @override
  final String name;
  @override
  final double consumed;
  @override
  @JsonKey()
  final dynamic goal;
  @override
  @JsonKey()
  final dynamic difference;

  @override
  String toString() {
    return 'NutrientItemModel(name: $name, consumed: $consumed, goal: $goal, difference: $difference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientItemModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.consumed, consumed) ||
                other.consumed == consumed) &&
            const DeepCollectionEquality().equals(other.goal, goal) &&
            const DeepCollectionEquality()
                .equals(other.difference, difference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      consumed,
      const DeepCollectionEquality().hash(goal),
      const DeepCollectionEquality().hash(difference));

  /// Create a copy of NutrientItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientItemModelImplCopyWith<_$NutrientItemModelImpl> get copyWith =>
      __$$NutrientItemModelImplCopyWithImpl<_$NutrientItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientItemModelImplToJson(
      this,
    );
  }
}

abstract class _NutrientItemModel implements NutrientItemModel {
  const factory _NutrientItemModel(
      {required final String name,
      required final double consumed,
      final dynamic goal,
      final dynamic difference}) = _$NutrientItemModelImpl;

  factory _NutrientItemModel.fromJson(Map<String, dynamic> json) =
      _$NutrientItemModelImpl.fromJson;

  @override
  String get name;
  @override
  double get consumed;
  @override
  dynamic get goal;
  @override
  dynamic get difference;

  /// Create a copy of NutrientItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientItemModelImplCopyWith<_$NutrientItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
