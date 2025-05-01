// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cal_today_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalTodayModel _$CalTodayModelFromJson(Map<String, dynamic> json) {
  return _CalTodayModel.fromJson(json);
}

/// @nodoc
mixin _$CalTodayModel {
  @JsonKey(name: "calories")
  double? get calories => throw _privateConstructorUsedError;
  @JsonKey(name: "goal")
  double? get goal => throw _privateConstructorUsedError;

  /// Serializes this CalTodayModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalTodayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalTodayModelCopyWith<CalTodayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalTodayModelCopyWith<$Res> {
  factory $CalTodayModelCopyWith(
          CalTodayModel value, $Res Function(CalTodayModel) then) =
      _$CalTodayModelCopyWithImpl<$Res, CalTodayModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "calories") double? calories,
      @JsonKey(name: "goal") double? goal});
}

/// @nodoc
class _$CalTodayModelCopyWithImpl<$Res, $Val extends CalTodayModel>
    implements $CalTodayModelCopyWith<$Res> {
  _$CalTodayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalTodayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = freezed,
    Object? goal = freezed,
  }) {
    return _then(_value.copyWith(
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalTodayModelImplCopyWith<$Res>
    implements $CalTodayModelCopyWith<$Res> {
  factory _$$CalTodayModelImplCopyWith(
          _$CalTodayModelImpl value, $Res Function(_$CalTodayModelImpl) then) =
      __$$CalTodayModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "calories") double? calories,
      @JsonKey(name: "goal") double? goal});
}

/// @nodoc
class __$$CalTodayModelImplCopyWithImpl<$Res>
    extends _$CalTodayModelCopyWithImpl<$Res, _$CalTodayModelImpl>
    implements _$$CalTodayModelImplCopyWith<$Res> {
  __$$CalTodayModelImplCopyWithImpl(
      _$CalTodayModelImpl _value, $Res Function(_$CalTodayModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalTodayModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = freezed,
    Object? goal = freezed,
  }) {
    return _then(_$CalTodayModelImpl(
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalTodayModelImpl implements _CalTodayModel {
  const _$CalTodayModelImpl(
      {@JsonKey(name: "calories") this.calories,
      @JsonKey(name: "goal") this.goal});

  factory _$CalTodayModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalTodayModelImplFromJson(json);

  @override
  @JsonKey(name: "calories")
  final double? calories;
  @override
  @JsonKey(name: "goal")
  final double? goal;

  @override
  String toString() {
    return 'CalTodayModel(calories: $calories, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalTodayModelImpl &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, calories, goal);

  /// Create a copy of CalTodayModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalTodayModelImplCopyWith<_$CalTodayModelImpl> get copyWith =>
      __$$CalTodayModelImplCopyWithImpl<_$CalTodayModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalTodayModelImplToJson(
      this,
    );
  }
}

abstract class _CalTodayModel implements CalTodayModel {
  const factory _CalTodayModel(
      {@JsonKey(name: "calories") final double? calories,
      @JsonKey(name: "goal") final double? goal}) = _$CalTodayModelImpl;

  factory _CalTodayModel.fromJson(Map<String, dynamic> json) =
      _$CalTodayModelImpl.fromJson;

  @override
  @JsonKey(name: "calories")
  double? get calories;
  @override
  @JsonKey(name: "goal")
  double? get goal;

  /// Create a copy of CalTodayModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalTodayModelImplCopyWith<_$CalTodayModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
