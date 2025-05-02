// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_calorie_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyCalorieReportModel _$DailyCalorieReportModelFromJson(
    Map<String, dynamic> json) {
  return _DailyCalorieReportModel.fromJson(json);
}

/// @nodoc
mixin _$DailyCalorieReportModel {
  @JsonKey(name: 'goal')
  double? get goal => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cal_today')
  double? get totalCalToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_calories')
  List<TodayCaloriesItemModel>? get todayCalories =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'average')
  double? get average => throw _privateConstructorUsedError;
  @JsonKey(name: 'graph')
  List<GraphCaloriesModel>? get graph => throw _privateConstructorUsedError;

  /// Serializes this DailyCalorieReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyCalorieReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyCalorieReportModelCopyWith<DailyCalorieReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyCalorieReportModelCopyWith<$Res> {
  factory $DailyCalorieReportModelCopyWith(DailyCalorieReportModel value,
          $Res Function(DailyCalorieReportModel) then) =
      _$DailyCalorieReportModelCopyWithImpl<$Res, DailyCalorieReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'goal') double? goal,
      @JsonKey(name: 'total_cal_today') double? totalCalToday,
      @JsonKey(name: 'today_calories')
      List<TodayCaloriesItemModel>? todayCalories,
      @JsonKey(name: 'average') double? average,
      @JsonKey(name: 'graph') List<GraphCaloriesModel>? graph});
}

/// @nodoc
class _$DailyCalorieReportModelCopyWithImpl<$Res,
        $Val extends DailyCalorieReportModel>
    implements $DailyCalorieReportModelCopyWith<$Res> {
  _$DailyCalorieReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyCalorieReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = freezed,
    Object? totalCalToday = freezed,
    Object? todayCalories = freezed,
    Object? average = freezed,
    Object? graph = freezed,
  }) {
    return _then(_value.copyWith(
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCalToday: freezed == totalCalToday
          ? _value.totalCalToday
          : totalCalToday // ignore: cast_nullable_to_non_nullable
              as double?,
      todayCalories: freezed == todayCalories
          ? _value.todayCalories
          : todayCalories // ignore: cast_nullable_to_non_nullable
              as List<TodayCaloriesItemModel>?,
      average: freezed == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double?,
      graph: freezed == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<GraphCaloriesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyCalorieReportModelImplCopyWith<$Res>
    implements $DailyCalorieReportModelCopyWith<$Res> {
  factory _$$DailyCalorieReportModelImplCopyWith(
          _$DailyCalorieReportModelImpl value,
          $Res Function(_$DailyCalorieReportModelImpl) then) =
      __$$DailyCalorieReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'goal') double? goal,
      @JsonKey(name: 'total_cal_today') double? totalCalToday,
      @JsonKey(name: 'today_calories')
      List<TodayCaloriesItemModel>? todayCalories,
      @JsonKey(name: 'average') double? average,
      @JsonKey(name: 'graph') List<GraphCaloriesModel>? graph});
}

/// @nodoc
class __$$DailyCalorieReportModelImplCopyWithImpl<$Res>
    extends _$DailyCalorieReportModelCopyWithImpl<$Res,
        _$DailyCalorieReportModelImpl>
    implements _$$DailyCalorieReportModelImplCopyWith<$Res> {
  __$$DailyCalorieReportModelImplCopyWithImpl(
      _$DailyCalorieReportModelImpl _value,
      $Res Function(_$DailyCalorieReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyCalorieReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = freezed,
    Object? totalCalToday = freezed,
    Object? todayCalories = freezed,
    Object? average = freezed,
    Object? graph = freezed,
  }) {
    return _then(_$DailyCalorieReportModelImpl(
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCalToday: freezed == totalCalToday
          ? _value.totalCalToday
          : totalCalToday // ignore: cast_nullable_to_non_nullable
              as double?,
      todayCalories: freezed == todayCalories
          ? _value._todayCalories
          : todayCalories // ignore: cast_nullable_to_non_nullable
              as List<TodayCaloriesItemModel>?,
      average: freezed == average
          ? _value.average
          : average // ignore: cast_nullable_to_non_nullable
              as double?,
      graph: freezed == graph
          ? _value._graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<GraphCaloriesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyCalorieReportModelImpl implements _DailyCalorieReportModel {
  const _$DailyCalorieReportModelImpl(
      {@JsonKey(name: 'goal') this.goal,
      @JsonKey(name: 'total_cal_today') this.totalCalToday,
      @JsonKey(name: 'today_calories')
      final List<TodayCaloriesItemModel>? todayCalories,
      @JsonKey(name: 'average') this.average,
      @JsonKey(name: 'graph') final List<GraphCaloriesModel>? graph})
      : _todayCalories = todayCalories,
        _graph = graph;

  factory _$DailyCalorieReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyCalorieReportModelImplFromJson(json);

  @override
  @JsonKey(name: 'goal')
  final double? goal;
  @override
  @JsonKey(name: 'total_cal_today')
  final double? totalCalToday;
  final List<TodayCaloriesItemModel>? _todayCalories;
  @override
  @JsonKey(name: 'today_calories')
  List<TodayCaloriesItemModel>? get todayCalories {
    final value = _todayCalories;
    if (value == null) return null;
    if (_todayCalories is EqualUnmodifiableListView) return _todayCalories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'average')
  final double? average;
  final List<GraphCaloriesModel>? _graph;
  @override
  @JsonKey(name: 'graph')
  List<GraphCaloriesModel>? get graph {
    final value = _graph;
    if (value == null) return null;
    if (_graph is EqualUnmodifiableListView) return _graph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DailyCalorieReportModel(goal: $goal, totalCalToday: $totalCalToday, todayCalories: $todayCalories, average: $average, graph: $graph)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyCalorieReportModelImpl &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.totalCalToday, totalCalToday) ||
                other.totalCalToday == totalCalToday) &&
            const DeepCollectionEquality()
                .equals(other._todayCalories, _todayCalories) &&
            (identical(other.average, average) || other.average == average) &&
            const DeepCollectionEquality().equals(other._graph, _graph));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      goal,
      totalCalToday,
      const DeepCollectionEquality().hash(_todayCalories),
      average,
      const DeepCollectionEquality().hash(_graph));

  /// Create a copy of DailyCalorieReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyCalorieReportModelImplCopyWith<_$DailyCalorieReportModelImpl>
      get copyWith => __$$DailyCalorieReportModelImplCopyWithImpl<
          _$DailyCalorieReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyCalorieReportModelImplToJson(
      this,
    );
  }
}

abstract class _DailyCalorieReportModel implements DailyCalorieReportModel {
  const factory _DailyCalorieReportModel(
          {@JsonKey(name: 'goal') final double? goal,
          @JsonKey(name: 'total_cal_today') final double? totalCalToday,
          @JsonKey(name: 'today_calories')
          final List<TodayCaloriesItemModel>? todayCalories,
          @JsonKey(name: 'average') final double? average,
          @JsonKey(name: 'graph') final List<GraphCaloriesModel>? graph}) =
      _$DailyCalorieReportModelImpl;

  factory _DailyCalorieReportModel.fromJson(Map<String, dynamic> json) =
      _$DailyCalorieReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'goal')
  double? get goal;
  @override
  @JsonKey(name: 'total_cal_today')
  double? get totalCalToday;
  @override
  @JsonKey(name: 'today_calories')
  List<TodayCaloriesItemModel>? get todayCalories;
  @override
  @JsonKey(name: 'average')
  double? get average;
  @override
  @JsonKey(name: 'graph')
  List<GraphCaloriesModel>? get graph;

  /// Create a copy of DailyCalorieReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyCalorieReportModelImplCopyWith<_$DailyCalorieReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TodayCaloriesItemModel _$TodayCaloriesItemModelFromJson(
    Map<String, dynamic> json) {
  return _TodayCaloriesItemModel.fromJson(json);
}

/// @nodoc
mixin _$TodayCaloriesItemModel {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories')
  double? get calories => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage')
  double? get percentage => throw _privateConstructorUsedError;

  /// Serializes this TodayCaloriesItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayCaloriesItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayCaloriesItemModelCopyWith<TodayCaloriesItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayCaloriesItemModelCopyWith<$Res> {
  factory $TodayCaloriesItemModelCopyWith(TodayCaloriesItemModel value,
          $Res Function(TodayCaloriesItemModel) then) =
      _$TodayCaloriesItemModelCopyWithImpl<$Res, TodayCaloriesItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'calories') double? calories,
      @JsonKey(name: 'percentage') double? percentage});
}

/// @nodoc
class _$TodayCaloriesItemModelCopyWithImpl<$Res,
        $Val extends TodayCaloriesItemModel>
    implements $TodayCaloriesItemModelCopyWith<$Res> {
  _$TodayCaloriesItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayCaloriesItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? calories = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodayCaloriesItemModelImplCopyWith<$Res>
    implements $TodayCaloriesItemModelCopyWith<$Res> {
  factory _$$TodayCaloriesItemModelImplCopyWith(
          _$TodayCaloriesItemModelImpl value,
          $Res Function(_$TodayCaloriesItemModelImpl) then) =
      __$$TodayCaloriesItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'calories') double? calories,
      @JsonKey(name: 'percentage') double? percentage});
}

/// @nodoc
class __$$TodayCaloriesItemModelImplCopyWithImpl<$Res>
    extends _$TodayCaloriesItemModelCopyWithImpl<$Res,
        _$TodayCaloriesItemModelImpl>
    implements _$$TodayCaloriesItemModelImplCopyWith<$Res> {
  __$$TodayCaloriesItemModelImplCopyWithImpl(
      _$TodayCaloriesItemModelImpl _value,
      $Res Function(_$TodayCaloriesItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayCaloriesItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? calories = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_$TodayCaloriesItemModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayCaloriesItemModelImpl implements _TodayCaloriesItemModel {
  const _$TodayCaloriesItemModelImpl(
      {@JsonKey(name: 'type') this.type,
      @JsonKey(name: 'calories') this.calories,
      @JsonKey(name: 'percentage') this.percentage});

  factory _$TodayCaloriesItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayCaloriesItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'calories')
  final double? calories;
  @override
  @JsonKey(name: 'percentage')
  final double? percentage;

  @override
  String toString() {
    return 'TodayCaloriesItemModel(type: $type, calories: $calories, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayCaloriesItemModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, calories, percentage);

  /// Create a copy of TodayCaloriesItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayCaloriesItemModelImplCopyWith<_$TodayCaloriesItemModelImpl>
      get copyWith => __$$TodayCaloriesItemModelImplCopyWithImpl<
          _$TodayCaloriesItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayCaloriesItemModelImplToJson(
      this,
    );
  }
}

abstract class _TodayCaloriesItemModel implements TodayCaloriesItemModel {
  const factory _TodayCaloriesItemModel(
          {@JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'calories') final double? calories,
          @JsonKey(name: 'percentage') final double? percentage}) =
      _$TodayCaloriesItemModelImpl;

  factory _TodayCaloriesItemModel.fromJson(Map<String, dynamic> json) =
      _$TodayCaloriesItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'calories')
  double? get calories;
  @override
  @JsonKey(name: 'percentage')
  double? get percentage;

  /// Create a copy of TodayCaloriesItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayCaloriesItemModelImplCopyWith<_$TodayCaloriesItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GraphCaloriesModel _$GraphCaloriesModelFromJson(Map<String, dynamic> json) {
  return _GraphCaloriesModel.fromJson(json);
}

/// @nodoc
mixin _$GraphCaloriesModel {
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'Breakfast')
  double? get breakfast => throw _privateConstructorUsedError;
  @JsonKey(name: 'Lunch')
  double? get lunch => throw _privateConstructorUsedError;
  @JsonKey(name: 'Dinner')
  double? get dinner => throw _privateConstructorUsedError;
  @JsonKey(name: 'Snacks/Other')
  double? get snacksOther => throw _privateConstructorUsedError;

  /// Serializes this GraphCaloriesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GraphCaloriesModelCopyWith<GraphCaloriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphCaloriesModelCopyWith<$Res> {
  factory $GraphCaloriesModelCopyWith(
          GraphCaloriesModel value, $Res Function(GraphCaloriesModel) then) =
      _$GraphCaloriesModelCopyWithImpl<$Res, GraphCaloriesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'Breakfast') double? breakfast,
      @JsonKey(name: 'Lunch') double? lunch,
      @JsonKey(name: 'Dinner') double? dinner,
      @JsonKey(name: 'Snacks/Other') double? snacksOther});
}

/// @nodoc
class _$GraphCaloriesModelCopyWithImpl<$Res, $Val extends GraphCaloriesModel>
    implements $GraphCaloriesModelCopyWith<$Res> {
  _$GraphCaloriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
    Object? snacksOther = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      breakfast: freezed == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as double?,
      lunch: freezed == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as double?,
      dinner: freezed == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as double?,
      snacksOther: freezed == snacksOther
          ? _value.snacksOther
          : snacksOther // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GraphCaloriesModelImplCopyWith<$Res>
    implements $GraphCaloriesModelCopyWith<$Res> {
  factory _$$GraphCaloriesModelImplCopyWith(_$GraphCaloriesModelImpl value,
          $Res Function(_$GraphCaloriesModelImpl) then) =
      __$$GraphCaloriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'Breakfast') double? breakfast,
      @JsonKey(name: 'Lunch') double? lunch,
      @JsonKey(name: 'Dinner') double? dinner,
      @JsonKey(name: 'Snacks/Other') double? snacksOther});
}

/// @nodoc
class __$$GraphCaloriesModelImplCopyWithImpl<$Res>
    extends _$GraphCaloriesModelCopyWithImpl<$Res, _$GraphCaloriesModelImpl>
    implements _$$GraphCaloriesModelImplCopyWith<$Res> {
  __$$GraphCaloriesModelImplCopyWithImpl(_$GraphCaloriesModelImpl _value,
      $Res Function(_$GraphCaloriesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
    Object? snacksOther = freezed,
  }) {
    return _then(_$GraphCaloriesModelImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      breakfast: freezed == breakfast
          ? _value.breakfast
          : breakfast // ignore: cast_nullable_to_non_nullable
              as double?,
      lunch: freezed == lunch
          ? _value.lunch
          : lunch // ignore: cast_nullable_to_non_nullable
              as double?,
      dinner: freezed == dinner
          ? _value.dinner
          : dinner // ignore: cast_nullable_to_non_nullable
              as double?,
      snacksOther: freezed == snacksOther
          ? _value.snacksOther
          : snacksOther // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GraphCaloriesModelImpl implements _GraphCaloriesModel {
  const _$GraphCaloriesModelImpl(
      {@JsonKey(name: 'date') this.date,
      @JsonKey(name: 'Breakfast') this.breakfast,
      @JsonKey(name: 'Lunch') this.lunch,
      @JsonKey(name: 'Dinner') this.dinner,
      @JsonKey(name: 'Snacks/Other') this.snacksOther});

  factory _$GraphCaloriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraphCaloriesModelImplFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'Breakfast')
  final double? breakfast;
  @override
  @JsonKey(name: 'Lunch')
  final double? lunch;
  @override
  @JsonKey(name: 'Dinner')
  final double? dinner;
  @override
  @JsonKey(name: 'Snacks/Other')
  final double? snacksOther;

  @override
  String toString() {
    return 'GraphCaloriesModel(date: $date, breakfast: $breakfast, lunch: $lunch, dinner: $dinner, snacksOther: $snacksOther)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphCaloriesModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.breakfast, breakfast) ||
                other.breakfast == breakfast) &&
            (identical(other.lunch, lunch) || other.lunch == lunch) &&
            (identical(other.dinner, dinner) || other.dinner == dinner) &&
            (identical(other.snacksOther, snacksOther) ||
                other.snacksOther == snacksOther));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, breakfast, lunch, dinner, snacksOther);

  /// Create a copy of GraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphCaloriesModelImplCopyWith<_$GraphCaloriesModelImpl> get copyWith =>
      __$$GraphCaloriesModelImplCopyWithImpl<_$GraphCaloriesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraphCaloriesModelImplToJson(
      this,
    );
  }
}

abstract class _GraphCaloriesModel implements GraphCaloriesModel {
  const factory _GraphCaloriesModel(
          {@JsonKey(name: 'date') final String? date,
          @JsonKey(name: 'Breakfast') final double? breakfast,
          @JsonKey(name: 'Lunch') final double? lunch,
          @JsonKey(name: 'Dinner') final double? dinner,
          @JsonKey(name: 'Snacks/Other') final double? snacksOther}) =
      _$GraphCaloriesModelImpl;

  factory _GraphCaloriesModel.fromJson(Map<String, dynamic> json) =
      _$GraphCaloriesModelImpl.fromJson;

  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'Breakfast')
  double? get breakfast;
  @override
  @JsonKey(name: 'Lunch')
  double? get lunch;
  @override
  @JsonKey(name: 'Dinner')
  double? get dinner;
  @override
  @JsonKey(name: 'Snacks/Other')
  double? get snacksOther;

  /// Create a copy of GraphCaloriesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GraphCaloriesModelImplCopyWith<_$GraphCaloriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
