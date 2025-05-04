// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_graph_calories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyGraphCaloriesModel _$WeeklyGraphCaloriesModelFromJson(
    Map<String, dynamic> json) {
  return _WeeklyGraphCaloriesModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyGraphCaloriesModel {
  @JsonKey(name: 'graph')
  List<GraphCaloriesItem>? get graph => throw _privateConstructorUsedError;

  /// Serializes this WeeklyGraphCaloriesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyGraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyGraphCaloriesModelCopyWith<WeeklyGraphCaloriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyGraphCaloriesModelCopyWith<$Res> {
  factory $WeeklyGraphCaloriesModelCopyWith(WeeklyGraphCaloriesModel value,
          $Res Function(WeeklyGraphCaloriesModel) then) =
      _$WeeklyGraphCaloriesModelCopyWithImpl<$Res, WeeklyGraphCaloriesModel>;
  @useResult
  $Res call({@JsonKey(name: 'graph') List<GraphCaloriesItem>? graph});
}

/// @nodoc
class _$WeeklyGraphCaloriesModelCopyWithImpl<$Res,
        $Val extends WeeklyGraphCaloriesModel>
    implements $WeeklyGraphCaloriesModelCopyWith<$Res> {
  _$WeeklyGraphCaloriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyGraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = freezed,
  }) {
    return _then(_value.copyWith(
      graph: freezed == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<GraphCaloriesItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyGraphCaloriesModelImplCopyWith<$Res>
    implements $WeeklyGraphCaloriesModelCopyWith<$Res> {
  factory _$$WeeklyGraphCaloriesModelImplCopyWith(
          _$WeeklyGraphCaloriesModelImpl value,
          $Res Function(_$WeeklyGraphCaloriesModelImpl) then) =
      __$$WeeklyGraphCaloriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'graph') List<GraphCaloriesItem>? graph});
}

/// @nodoc
class __$$WeeklyGraphCaloriesModelImplCopyWithImpl<$Res>
    extends _$WeeklyGraphCaloriesModelCopyWithImpl<$Res,
        _$WeeklyGraphCaloriesModelImpl>
    implements _$$WeeklyGraphCaloriesModelImplCopyWith<$Res> {
  __$$WeeklyGraphCaloriesModelImplCopyWithImpl(
      _$WeeklyGraphCaloriesModelImpl _value,
      $Res Function(_$WeeklyGraphCaloriesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyGraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = freezed,
  }) {
    return _then(_$WeeklyGraphCaloriesModelImpl(
      graph: freezed == graph
          ? _value._graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<GraphCaloriesItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyGraphCaloriesModelImpl implements _WeeklyGraphCaloriesModel {
  const _$WeeklyGraphCaloriesModelImpl(
      {@JsonKey(name: 'graph') final List<GraphCaloriesItem>? graph})
      : _graph = graph;

  factory _$WeeklyGraphCaloriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyGraphCaloriesModelImplFromJson(json);

  final List<GraphCaloriesItem>? _graph;
  @override
  @JsonKey(name: 'graph')
  List<GraphCaloriesItem>? get graph {
    final value = _graph;
    if (value == null) return null;
    if (_graph is EqualUnmodifiableListView) return _graph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WeeklyGraphCaloriesModel(graph: $graph)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyGraphCaloriesModelImpl &&
            const DeepCollectionEquality().equals(other._graph, _graph));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_graph));

  /// Create a copy of WeeklyGraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyGraphCaloriesModelImplCopyWith<_$WeeklyGraphCaloriesModelImpl>
      get copyWith => __$$WeeklyGraphCaloriesModelImplCopyWithImpl<
          _$WeeklyGraphCaloriesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyGraphCaloriesModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyGraphCaloriesModel implements WeeklyGraphCaloriesModel {
  const factory _WeeklyGraphCaloriesModel(
          {@JsonKey(name: 'graph') final List<GraphCaloriesItem>? graph}) =
      _$WeeklyGraphCaloriesModelImpl;

  factory _WeeklyGraphCaloriesModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyGraphCaloriesModelImpl.fromJson;

  @override
  @JsonKey(name: 'graph')
  List<GraphCaloriesItem>? get graph;

  /// Create a copy of WeeklyGraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyGraphCaloriesModelImplCopyWith<_$WeeklyGraphCaloriesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GraphCaloriesItem _$GraphCaloriesItemFromJson(Map<String, dynamic> json) {
  return _GraphCaloriesItem.fromJson(json);
}

/// @nodoc
mixin _$GraphCaloriesItem {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_energy')
  double? get totalEnergy => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_of_goal')
  double? get percentageOfGoal => throw _privateConstructorUsedError;

  /// Serializes this GraphCaloriesItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GraphCaloriesItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GraphCaloriesItemCopyWith<GraphCaloriesItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphCaloriesItemCopyWith<$Res> {
  factory $GraphCaloriesItemCopyWith(
          GraphCaloriesItem value, $Res Function(GraphCaloriesItem) then) =
      _$GraphCaloriesItemCopyWithImpl<$Res, GraphCaloriesItem>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'total_energy') double? totalEnergy,
      @JsonKey(name: 'percentage_of_goal') double? percentageOfGoal});
}

/// @nodoc
class _$GraphCaloriesItemCopyWithImpl<$Res, $Val extends GraphCaloriesItem>
    implements $GraphCaloriesItemCopyWith<$Res> {
  _$GraphCaloriesItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphCaloriesItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalEnergy = freezed,
    Object? percentageOfGoal = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalEnergy: freezed == totalEnergy
          ? _value.totalEnergy
          : totalEnergy // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageOfGoal: freezed == percentageOfGoal
          ? _value.percentageOfGoal
          : percentageOfGoal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphCaloriesItemImplCopyWith<$Res>
    implements $GraphCaloriesItemCopyWith<$Res> {
  factory _$$GraphCaloriesItemImplCopyWith(_$GraphCaloriesItemImpl value,
          $Res Function(_$GraphCaloriesItemImpl) then) =
      __$$GraphCaloriesItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'total_energy') double? totalEnergy,
      @JsonKey(name: 'percentage_of_goal') double? percentageOfGoal});
}

/// @nodoc
class __$$GraphCaloriesItemImplCopyWithImpl<$Res>
    extends _$GraphCaloriesItemCopyWithImpl<$Res, _$GraphCaloriesItemImpl>
    implements _$$GraphCaloriesItemImplCopyWith<$Res> {
  __$$GraphCaloriesItemImplCopyWithImpl(_$GraphCaloriesItemImpl _value,
      $Res Function(_$GraphCaloriesItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphCaloriesItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalEnergy = freezed,
    Object? percentageOfGoal = freezed,
  }) {
    return _then(_$GraphCaloriesItemImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      totalEnergy: freezed == totalEnergy
          ? _value.totalEnergy
          : totalEnergy // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageOfGoal: freezed == percentageOfGoal
          ? _value.percentageOfGoal
          : percentageOfGoal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GraphCaloriesItemImpl implements _GraphCaloriesItem {
  const _$GraphCaloriesItemImpl(
      {required this.date,
      @JsonKey(name: 'total_energy') this.totalEnergy,
      @JsonKey(name: 'percentage_of_goal') this.percentageOfGoal});

  factory _$GraphCaloriesItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraphCaloriesItemImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'total_energy')
  final double? totalEnergy;
  @override
  @JsonKey(name: 'percentage_of_goal')
  final double? percentageOfGoal;

  @override
  String toString() {
    return 'GraphCaloriesItem(date: $date, totalEnergy: $totalEnergy, percentageOfGoal: $percentageOfGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphCaloriesItemImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalEnergy, totalEnergy) ||
                other.totalEnergy == totalEnergy) &&
            (identical(other.percentageOfGoal, percentageOfGoal) ||
                other.percentageOfGoal == percentageOfGoal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, totalEnergy, percentageOfGoal);

  /// Create a copy of GraphCaloriesItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphCaloriesItemImplCopyWith<_$GraphCaloriesItemImpl> get copyWith =>
      __$$GraphCaloriesItemImplCopyWithImpl<_$GraphCaloriesItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraphCaloriesItemImplToJson(
      this,
    );
  }
}

abstract class _GraphCaloriesItem implements GraphCaloriesItem {
  const factory _GraphCaloriesItem(
      {required final String date,
      @JsonKey(name: 'total_energy') final double? totalEnergy,
      @JsonKey(name: 'percentage_of_goal')
      final double? percentageOfGoal}) = _$GraphCaloriesItemImpl;

  factory _GraphCaloriesItem.fromJson(Map<String, dynamic> json) =
      _$GraphCaloriesItemImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'total_energy')
  double? get totalEnergy;
  @override
  @JsonKey(name: 'percentage_of_goal')
  double? get percentageOfGoal;

  /// Create a copy of GraphCaloriesItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphCaloriesItemImplCopyWith<_$GraphCaloriesItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
