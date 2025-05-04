// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_resume_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyResumeReportModel _$WeeklyResumeReportModelFromJson(
    Map<String, dynamic> json) {
  return _WeeklyResumeReportModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyResumeReportModel {
  @JsonKey(name: 'total_all')
  double? get totalAll => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
  Map<String, double>? get nutrientPercentage =>
      throw _privateConstructorUsedError;

  /// Serializes this WeeklyResumeReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyResumeReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyResumeReportModelCopyWith<WeeklyResumeReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyResumeReportModelCopyWith<$Res> {
  factory $WeeklyResumeReportModelCopyWith(WeeklyResumeReportModel value,
          $Res Function(WeeklyResumeReportModel) then) =
      _$WeeklyResumeReportModelCopyWithImpl<$Res, WeeklyResumeReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_all') double? totalAll,
      @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
      Map<String, double>? nutrientPercentage});
}

/// @nodoc
class _$WeeklyResumeReportModelCopyWithImpl<$Res,
        $Val extends WeeklyResumeReportModel>
    implements $WeeklyResumeReportModelCopyWith<$Res> {
  _$WeeklyResumeReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyResumeReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAll = freezed,
    Object? nutrientPercentage = freezed,
  }) {
    return _then(_value.copyWith(
      totalAll: freezed == totalAll
          ? _value.totalAll
          : totalAll // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrientPercentage: freezed == nutrientPercentage
          ? _value.nutrientPercentage
          : nutrientPercentage // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyResumeReportModelImplCopyWith<$Res>
    implements $WeeklyResumeReportModelCopyWith<$Res> {
  factory _$$WeeklyResumeReportModelImplCopyWith(
          _$WeeklyResumeReportModelImpl value,
          $Res Function(_$WeeklyResumeReportModelImpl) then) =
      __$$WeeklyResumeReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_all') double? totalAll,
      @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
      Map<String, double>? nutrientPercentage});
}

/// @nodoc
class __$$WeeklyResumeReportModelImplCopyWithImpl<$Res>
    extends _$WeeklyResumeReportModelCopyWithImpl<$Res,
        _$WeeklyResumeReportModelImpl>
    implements _$$WeeklyResumeReportModelImplCopyWith<$Res> {
  __$$WeeklyResumeReportModelImplCopyWithImpl(
      _$WeeklyResumeReportModelImpl _value,
      $Res Function(_$WeeklyResumeReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyResumeReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAll = freezed,
    Object? nutrientPercentage = freezed,
  }) {
    return _then(_$WeeklyResumeReportModelImpl(
      totalAll: freezed == totalAll
          ? _value.totalAll
          : totalAll // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrientPercentage: freezed == nutrientPercentage
          ? _value._nutrientPercentage
          : nutrientPercentage // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyResumeReportModelImpl implements _WeeklyResumeReportModel {
  const _$WeeklyResumeReportModelImpl(
      {@JsonKey(name: 'total_all') this.totalAll,
      @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
      final Map<String, double>? nutrientPercentage})
      : _nutrientPercentage = nutrientPercentage;

  factory _$WeeklyResumeReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyResumeReportModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_all')
  final double? totalAll;
  final Map<String, double>? _nutrientPercentage;
  @override
  @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
  Map<String, double>? get nutrientPercentage {
    final value = _nutrientPercentage;
    if (value == null) return null;
    if (_nutrientPercentage is EqualUnmodifiableMapView)
      return _nutrientPercentage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WeeklyResumeReportModel(totalAll: $totalAll, nutrientPercentage: $nutrientPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyResumeReportModelImpl &&
            (identical(other.totalAll, totalAll) ||
                other.totalAll == totalAll) &&
            const DeepCollectionEquality()
                .equals(other._nutrientPercentage, _nutrientPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalAll,
      const DeepCollectionEquality().hash(_nutrientPercentage));

  /// Create a copy of WeeklyResumeReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyResumeReportModelImplCopyWith<_$WeeklyResumeReportModelImpl>
      get copyWith => __$$WeeklyResumeReportModelImplCopyWithImpl<
          _$WeeklyResumeReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyResumeReportModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyResumeReportModel implements WeeklyResumeReportModel {
  const factory _WeeklyResumeReportModel(
          {@JsonKey(name: 'total_all') final double? totalAll,
          @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
          final Map<String, double>? nutrientPercentage}) =
      _$WeeklyResumeReportModelImpl;

  factory _WeeklyResumeReportModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyResumeReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_all')
  double? get totalAll;
  @override
  @JsonKey(name: 'nutrient_percentage', fromJson: _filterNonZeroMap)
  Map<String, double>? get nutrientPercentage;

  /// Create a copy of WeeklyResumeReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyResumeReportModelImplCopyWith<_$WeeklyResumeReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
