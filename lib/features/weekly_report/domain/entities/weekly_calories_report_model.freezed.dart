// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_calories_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyCaloriesReportModel _$WeeklyCaloriesReportModelFromJson(
    Map<String, dynamic> json) {
  return _WeeklyCaloriesReportModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyCaloriesReportModel {
  @JsonKey(name: 'weekly_goal')
  double? get weeklyGoal => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_consumed')
  double? get weeklyConsumed => throw _privateConstructorUsedError;
  double get difference => throw _privateConstructorUsedError;

  /// Serializes this WeeklyCaloriesReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyCaloriesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyCaloriesReportModelCopyWith<WeeklyCaloriesReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyCaloriesReportModelCopyWith<$Res> {
  factory $WeeklyCaloriesReportModelCopyWith(WeeklyCaloriesReportModel value,
          $Res Function(WeeklyCaloriesReportModel) then) =
      _$WeeklyCaloriesReportModelCopyWithImpl<$Res, WeeklyCaloriesReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'weekly_goal') double? weeklyGoal,
      @JsonKey(name: 'weekly_consumed') double? weeklyConsumed,
      double difference});
}

/// @nodoc
class _$WeeklyCaloriesReportModelCopyWithImpl<$Res,
        $Val extends WeeklyCaloriesReportModel>
    implements $WeeklyCaloriesReportModelCopyWith<$Res> {
  _$WeeklyCaloriesReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyCaloriesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyGoal = freezed,
    Object? weeklyConsumed = freezed,
    Object? difference = null,
  }) {
    return _then(_value.copyWith(
      weeklyGoal: freezed == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as double?,
      weeklyConsumed: freezed == weeklyConsumed
          ? _value.weeklyConsumed
          : weeklyConsumed // ignore: cast_nullable_to_non_nullable
              as double?,
      difference: null == difference
          ? _value.difference
          : difference // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyCaloriesReportModelImplCopyWith<$Res>
    implements $WeeklyCaloriesReportModelCopyWith<$Res> {
  factory _$$WeeklyCaloriesReportModelImplCopyWith(
          _$WeeklyCaloriesReportModelImpl value,
          $Res Function(_$WeeklyCaloriesReportModelImpl) then) =
      __$$WeeklyCaloriesReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'weekly_goal') double? weeklyGoal,
      @JsonKey(name: 'weekly_consumed') double? weeklyConsumed,
      double difference});
}

/// @nodoc
class __$$WeeklyCaloriesReportModelImplCopyWithImpl<$Res>
    extends _$WeeklyCaloriesReportModelCopyWithImpl<$Res,
        _$WeeklyCaloriesReportModelImpl>
    implements _$$WeeklyCaloriesReportModelImplCopyWith<$Res> {
  __$$WeeklyCaloriesReportModelImplCopyWithImpl(
      _$WeeklyCaloriesReportModelImpl _value,
      $Res Function(_$WeeklyCaloriesReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyCaloriesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyGoal = freezed,
    Object? weeklyConsumed = freezed,
    Object? difference = null,
  }) {
    return _then(_$WeeklyCaloriesReportModelImpl(
      weeklyGoal: freezed == weeklyGoal
          ? _value.weeklyGoal
          : weeklyGoal // ignore: cast_nullable_to_non_nullable
              as double?,
      weeklyConsumed: freezed == weeklyConsumed
          ? _value.weeklyConsumed
          : weeklyConsumed // ignore: cast_nullable_to_non_nullable
              as double?,
      difference: null == difference
          ? _value.difference
          : difference // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyCaloriesReportModelImpl implements _WeeklyCaloriesReportModel {
  const _$WeeklyCaloriesReportModelImpl(
      {@JsonKey(name: 'weekly_goal') this.weeklyGoal,
      @JsonKey(name: 'weekly_consumed') this.weeklyConsumed,
      required this.difference});

  factory _$WeeklyCaloriesReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyCaloriesReportModelImplFromJson(json);

  @override
  @JsonKey(name: 'weekly_goal')
  final double? weeklyGoal;
  @override
  @JsonKey(name: 'weekly_consumed')
  final double? weeklyConsumed;
  @override
  final double difference;

  @override
  String toString() {
    return 'WeeklyCaloriesReportModel(weeklyGoal: $weeklyGoal, weeklyConsumed: $weeklyConsumed, difference: $difference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyCaloriesReportModelImpl &&
            (identical(other.weeklyGoal, weeklyGoal) ||
                other.weeklyGoal == weeklyGoal) &&
            (identical(other.weeklyConsumed, weeklyConsumed) ||
                other.weeklyConsumed == weeklyConsumed) &&
            (identical(other.difference, difference) ||
                other.difference == difference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, weeklyGoal, weeklyConsumed, difference);

  /// Create a copy of WeeklyCaloriesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyCaloriesReportModelImplCopyWith<_$WeeklyCaloriesReportModelImpl>
      get copyWith => __$$WeeklyCaloriesReportModelImplCopyWithImpl<
          _$WeeklyCaloriesReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyCaloriesReportModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyCaloriesReportModel implements WeeklyCaloriesReportModel {
  const factory _WeeklyCaloriesReportModel(
      {@JsonKey(name: 'weekly_goal') final double? weeklyGoal,
      @JsonKey(name: 'weekly_consumed') final double? weeklyConsumed,
      required final double difference}) = _$WeeklyCaloriesReportModelImpl;

  factory _WeeklyCaloriesReportModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyCaloriesReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'weekly_goal')
  double? get weeklyGoal;
  @override
  @JsonKey(name: 'weekly_consumed')
  double? get weeklyConsumed;
  @override
  double get difference;

  /// Create a copy of WeeklyCaloriesReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyCaloriesReportModelImplCopyWith<_$WeeklyCaloriesReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
