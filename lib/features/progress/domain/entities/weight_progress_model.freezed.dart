// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeightTrafficModel _$WeightTrafficModelFromJson(Map<String, dynamic> json) {
  return _WeightTrafficModel.fromJson(json);
}

/// @nodoc
mixin _$WeightTrafficModel {
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "weight")
  double get weight => throw _privateConstructorUsedError;

  /// Serializes this WeightTrafficModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeightTrafficModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightTrafficModelCopyWith<WeightTrafficModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightTrafficModelCopyWith<$Res> {
  factory $WeightTrafficModelCopyWith(
          WeightTrafficModel value, $Res Function(WeightTrafficModel) then) =
      _$WeightTrafficModelCopyWithImpl<$Res, WeightTrafficModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "weight") double weight});
}

/// @nodoc
class _$WeightTrafficModelCopyWithImpl<$Res, $Val extends WeightTrafficModel>
    implements $WeightTrafficModelCopyWith<$Res> {
  _$WeightTrafficModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeightTrafficModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightTrafficModelImplCopyWith<$Res>
    implements $WeightTrafficModelCopyWith<$Res> {
  factory _$$WeightTrafficModelImplCopyWith(_$WeightTrafficModelImpl value,
          $Res Function(_$WeightTrafficModelImpl) then) =
      __$$WeightTrafficModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "weight") double weight});
}

/// @nodoc
class __$$WeightTrafficModelImplCopyWithImpl<$Res>
    extends _$WeightTrafficModelCopyWithImpl<$Res, _$WeightTrafficModelImpl>
    implements _$$WeightTrafficModelImplCopyWith<$Res> {
  __$$WeightTrafficModelImplCopyWithImpl(_$WeightTrafficModelImpl _value,
      $Res Function(_$WeightTrafficModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeightTrafficModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? weight = null,
  }) {
    return _then(_$WeightTrafficModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightTrafficModelImpl implements _WeightTrafficModel {
  const _$WeightTrafficModelImpl(
      {@JsonKey(name: "date") required this.date,
      @JsonKey(name: "weight") required this.weight});

  factory _$WeightTrafficModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightTrafficModelImplFromJson(json);

  @override
  @JsonKey(name: "date")
  final DateTime date;
  @override
  @JsonKey(name: "weight")
  final double weight;

  @override
  String toString() {
    return 'WeightTrafficModel(date: $date, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightTrafficModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, weight);

  /// Create a copy of WeightTrafficModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightTrafficModelImplCopyWith<_$WeightTrafficModelImpl> get copyWith =>
      __$$WeightTrafficModelImplCopyWithImpl<_$WeightTrafficModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightTrafficModelImplToJson(
      this,
    );
  }
}

abstract class _WeightTrafficModel implements WeightTrafficModel {
  const factory _WeightTrafficModel(
          {@JsonKey(name: "date") required final DateTime date,
          @JsonKey(name: "weight") required final double weight}) =
      _$WeightTrafficModelImpl;

  factory _WeightTrafficModel.fromJson(Map<String, dynamic> json) =
      _$WeightTrafficModelImpl.fromJson;

  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(name: "weight")
  double get weight;

  /// Create a copy of WeightTrafficModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightTrafficModelImplCopyWith<_$WeightTrafficModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeightProgressModel _$WeightProgressModelFromJson(Map<String, dynamic> json) {
  return _WeightProgressModel.fromJson(json);
}

/// @nodoc
mixin _$WeightProgressModel {
  @JsonKey(name: "weight")
  double? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: "weight_target")
  double? get weightTarget => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "traffic")
  List<WeightTrafficModel>? get traffic => throw _privateConstructorUsedError;

  /// Serializes this WeightProgressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeightProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightProgressModelCopyWith<WeightProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightProgressModelCopyWith<$Res> {
  factory $WeightProgressModelCopyWith(
          WeightProgressModel value, $Res Function(WeightProgressModel) then) =
      _$WeightProgressModelCopyWithImpl<$Res, WeightProgressModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "weight") double? weight,
      @JsonKey(name: "weight_target") double? weightTarget,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "traffic") List<WeightTrafficModel>? traffic});
}

/// @nodoc
class _$WeightProgressModelCopyWithImpl<$Res, $Val extends WeightProgressModel>
    implements $WeightProgressModelCopyWith<$Res> {
  _$WeightProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeightProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? weightTarget = freezed,
    Object? date = freezed,
    Object? traffic = freezed,
  }) {
    return _then(_value.copyWith(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightTarget: freezed == weightTarget
          ? _value.weightTarget
          : weightTarget // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      traffic: freezed == traffic
          ? _value.traffic
          : traffic // ignore: cast_nullable_to_non_nullable
              as List<WeightTrafficModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightProgressModelImplCopyWith<$Res>
    implements $WeightProgressModelCopyWith<$Res> {
  factory _$$WeightProgressModelImplCopyWith(_$WeightProgressModelImpl value,
          $Res Function(_$WeightProgressModelImpl) then) =
      __$$WeightProgressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "weight") double? weight,
      @JsonKey(name: "weight_target") double? weightTarget,
      @JsonKey(name: "date") DateTime? date,
      @JsonKey(name: "traffic") List<WeightTrafficModel>? traffic});
}

/// @nodoc
class __$$WeightProgressModelImplCopyWithImpl<$Res>
    extends _$WeightProgressModelCopyWithImpl<$Res, _$WeightProgressModelImpl>
    implements _$$WeightProgressModelImplCopyWith<$Res> {
  __$$WeightProgressModelImplCopyWithImpl(_$WeightProgressModelImpl _value,
      $Res Function(_$WeightProgressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeightProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? weightTarget = freezed,
    Object? date = freezed,
    Object? traffic = freezed,
  }) {
    return _then(_$WeightProgressModelImpl(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightTarget: freezed == weightTarget
          ? _value.weightTarget
          : weightTarget // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      traffic: freezed == traffic
          ? _value._traffic
          : traffic // ignore: cast_nullable_to_non_nullable
              as List<WeightTrafficModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightProgressModelImpl implements _WeightProgressModel {
  const _$WeightProgressModelImpl(
      {@JsonKey(name: "weight") this.weight,
      @JsonKey(name: "weight_target") this.weightTarget,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "traffic") final List<WeightTrafficModel>? traffic})
      : _traffic = traffic;

  factory _$WeightProgressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightProgressModelImplFromJson(json);

  @override
  @JsonKey(name: "weight")
  final double? weight;
  @override
  @JsonKey(name: "weight_target")
  final double? weightTarget;
  @override
  @JsonKey(name: "date")
  final DateTime? date;
  final List<WeightTrafficModel>? _traffic;
  @override
  @JsonKey(name: "traffic")
  List<WeightTrafficModel>? get traffic {
    final value = _traffic;
    if (value == null) return null;
    if (_traffic is EqualUnmodifiableListView) return _traffic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeightProgressModel(weight: $weight, weightTarget: $weightTarget, date: $date, traffic: $traffic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightProgressModelImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weightTarget, weightTarget) ||
                other.weightTarget == weightTarget) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._traffic, _traffic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weight, weightTarget, date,
      const DeepCollectionEquality().hash(_traffic));

  /// Create a copy of WeightProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightProgressModelImplCopyWith<_$WeightProgressModelImpl> get copyWith =>
      __$$WeightProgressModelImplCopyWithImpl<_$WeightProgressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightProgressModelImplToJson(
      this,
    );
  }
}

abstract class _WeightProgressModel implements WeightProgressModel {
  const factory _WeightProgressModel(
          {@JsonKey(name: "weight") final double? weight,
          @JsonKey(name: "weight_target") final double? weightTarget,
          @JsonKey(name: "date") final DateTime? date,
          @JsonKey(name: "traffic") final List<WeightTrafficModel>? traffic}) =
      _$WeightProgressModelImpl;

  factory _WeightProgressModel.fromJson(Map<String, dynamic> json) =
      _$WeightProgressModelImpl.fromJson;

  @override
  @JsonKey(name: "weight")
  double? get weight;
  @override
  @JsonKey(name: "weight_target")
  double? get weightTarget;
  @override
  @JsonKey(name: "date")
  DateTime? get date;
  @override
  @JsonKey(name: "traffic")
  List<WeightTrafficModel>? get traffic;

  /// Create a copy of WeightProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightProgressModelImplCopyWith<_$WeightProgressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
