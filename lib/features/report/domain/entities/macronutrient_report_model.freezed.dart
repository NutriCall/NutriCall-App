// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macronutrient_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MacronutrientReportModel _$MacronutrientReportModelFromJson(
    Map<String, dynamic> json) {
  return _MacronutrientReportModel.fromJson(json);
}

/// @nodoc
mixin _$MacronutrientReportModel {
  @JsonKey(name: 'graph')
  List<MacronutrientGraphModel>? get graph =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'today_macro')
  TodayMacronutrientModel? get todayMacro => throw _privateConstructorUsedError;

  /// Serializes this MacronutrientReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MacronutrientReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacronutrientReportModelCopyWith<MacronutrientReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacronutrientReportModelCopyWith<$Res> {
  factory $MacronutrientReportModelCopyWith(MacronutrientReportModel value,
          $Res Function(MacronutrientReportModel) then) =
      _$MacronutrientReportModelCopyWithImpl<$Res, MacronutrientReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'graph') List<MacronutrientGraphModel>? graph,
      @JsonKey(name: 'today_macro') TodayMacronutrientModel? todayMacro});

  $TodayMacronutrientModelCopyWith<$Res>? get todayMacro;
}

/// @nodoc
class _$MacronutrientReportModelCopyWithImpl<$Res,
        $Val extends MacronutrientReportModel>
    implements $MacronutrientReportModelCopyWith<$Res> {
  _$MacronutrientReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MacronutrientReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = freezed,
    Object? todayMacro = freezed,
  }) {
    return _then(_value.copyWith(
      graph: freezed == graph
          ? _value.graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<MacronutrientGraphModel>?,
      todayMacro: freezed == todayMacro
          ? _value.todayMacro
          : todayMacro // ignore: cast_nullable_to_non_nullable
              as TodayMacronutrientModel?,
    ) as $Val);
  }

  /// Create a copy of MacronutrientReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodayMacronutrientModelCopyWith<$Res>? get todayMacro {
    if (_value.todayMacro == null) {
      return null;
    }

    return $TodayMacronutrientModelCopyWith<$Res>(_value.todayMacro!, (value) {
      return _then(_value.copyWith(todayMacro: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MacronutrientReportModelImplCopyWith<$Res>
    implements $MacronutrientReportModelCopyWith<$Res> {
  factory _$$MacronutrientReportModelImplCopyWith(
          _$MacronutrientReportModelImpl value,
          $Res Function(_$MacronutrientReportModelImpl) then) =
      __$$MacronutrientReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'graph') List<MacronutrientGraphModel>? graph,
      @JsonKey(name: 'today_macro') TodayMacronutrientModel? todayMacro});

  @override
  $TodayMacronutrientModelCopyWith<$Res>? get todayMacro;
}

/// @nodoc
class __$$MacronutrientReportModelImplCopyWithImpl<$Res>
    extends _$MacronutrientReportModelCopyWithImpl<$Res,
        _$MacronutrientReportModelImpl>
    implements _$$MacronutrientReportModelImplCopyWith<$Res> {
  __$$MacronutrientReportModelImplCopyWithImpl(
      _$MacronutrientReportModelImpl _value,
      $Res Function(_$MacronutrientReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MacronutrientReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? graph = freezed,
    Object? todayMacro = freezed,
  }) {
    return _then(_$MacronutrientReportModelImpl(
      graph: freezed == graph
          ? _value._graph
          : graph // ignore: cast_nullable_to_non_nullable
              as List<MacronutrientGraphModel>?,
      todayMacro: freezed == todayMacro
          ? _value.todayMacro
          : todayMacro // ignore: cast_nullable_to_non_nullable
              as TodayMacronutrientModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MacronutrientReportModelImpl implements _MacronutrientReportModel {
  const _$MacronutrientReportModelImpl(
      {@JsonKey(name: 'graph') final List<MacronutrientGraphModel>? graph,
      @JsonKey(name: 'today_macro') this.todayMacro})
      : _graph = graph;

  factory _$MacronutrientReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacronutrientReportModelImplFromJson(json);

  final List<MacronutrientGraphModel>? _graph;
  @override
  @JsonKey(name: 'graph')
  List<MacronutrientGraphModel>? get graph {
    final value = _graph;
    if (value == null) return null;
    if (_graph is EqualUnmodifiableListView) return _graph;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'today_macro')
  final TodayMacronutrientModel? todayMacro;

  @override
  String toString() {
    return 'MacronutrientReportModel(graph: $graph, todayMacro: $todayMacro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacronutrientReportModelImpl &&
            const DeepCollectionEquality().equals(other._graph, _graph) &&
            (identical(other.todayMacro, todayMacro) ||
                other.todayMacro == todayMacro));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_graph), todayMacro);

  /// Create a copy of MacronutrientReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacronutrientReportModelImplCopyWith<_$MacronutrientReportModelImpl>
      get copyWith => __$$MacronutrientReportModelImplCopyWithImpl<
          _$MacronutrientReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacronutrientReportModelImplToJson(
      this,
    );
  }
}

abstract class _MacronutrientReportModel implements MacronutrientReportModel {
  const factory _MacronutrientReportModel(
          {@JsonKey(name: 'graph') final List<MacronutrientGraphModel>? graph,
          @JsonKey(name: 'today_macro')
          final TodayMacronutrientModel? todayMacro}) =
      _$MacronutrientReportModelImpl;

  factory _MacronutrientReportModel.fromJson(Map<String, dynamic> json) =
      _$MacronutrientReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'graph')
  List<MacronutrientGraphModel>? get graph;
  @override
  @JsonKey(name: 'today_macro')
  TodayMacronutrientModel? get todayMacro;

  /// Create a copy of MacronutrientReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacronutrientReportModelImplCopyWith<_$MacronutrientReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MacronutrientGraphModel _$MacronutrientGraphModelFromJson(
    Map<String, dynamic> json) {
  return _MacronutrientGraphModel.fromJson(json);
}

/// @nodoc
mixin _$MacronutrientGraphModel {
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'carbs')
  double? get carbs => throw _privateConstructorUsedError;
  @JsonKey(name: 'proteins')
  double? get proteins => throw _privateConstructorUsedError;
  @JsonKey(name: 'fats')
  double? get fats => throw _privateConstructorUsedError;

  /// Serializes this MacronutrientGraphModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MacronutrientGraphModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacronutrientGraphModelCopyWith<MacronutrientGraphModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacronutrientGraphModelCopyWith<$Res> {
  factory $MacronutrientGraphModelCopyWith(MacronutrientGraphModel value,
          $Res Function(MacronutrientGraphModel) then) =
      _$MacronutrientGraphModelCopyWithImpl<$Res, MacronutrientGraphModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'carbs') double? carbs,
      @JsonKey(name: 'proteins') double? proteins,
      @JsonKey(name: 'fats') double? fats});
}

/// @nodoc
class _$MacronutrientGraphModelCopyWithImpl<$Res,
        $Val extends MacronutrientGraphModel>
    implements $MacronutrientGraphModelCopyWith<$Res> {
  _$MacronutrientGraphModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MacronutrientGraphModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? carbs = freezed,
    Object? proteins = freezed,
    Object? fats = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      carbs: freezed == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MacronutrientGraphModelImplCopyWith<$Res>
    implements $MacronutrientGraphModelCopyWith<$Res> {
  factory _$$MacronutrientGraphModelImplCopyWith(
          _$MacronutrientGraphModelImpl value,
          $Res Function(_$MacronutrientGraphModelImpl) then) =
      __$$MacronutrientGraphModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date') String? date,
      @JsonKey(name: 'carbs') double? carbs,
      @JsonKey(name: 'proteins') double? proteins,
      @JsonKey(name: 'fats') double? fats});
}

/// @nodoc
class __$$MacronutrientGraphModelImplCopyWithImpl<$Res>
    extends _$MacronutrientGraphModelCopyWithImpl<$Res,
        _$MacronutrientGraphModelImpl>
    implements _$$MacronutrientGraphModelImplCopyWith<$Res> {
  __$$MacronutrientGraphModelImplCopyWithImpl(
      _$MacronutrientGraphModelImpl _value,
      $Res Function(_$MacronutrientGraphModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MacronutrientGraphModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? carbs = freezed,
    Object? proteins = freezed,
    Object? fats = freezed,
  }) {
    return _then(_$MacronutrientGraphModelImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      carbs: freezed == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MacronutrientGraphModelImpl implements _MacronutrientGraphModel {
  const _$MacronutrientGraphModelImpl(
      {@JsonKey(name: 'date') this.date,
      @JsonKey(name: 'carbs') this.carbs,
      @JsonKey(name: 'proteins') this.proteins,
      @JsonKey(name: 'fats') this.fats});

  factory _$MacronutrientGraphModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacronutrientGraphModelImplFromJson(json);

  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'carbs')
  final double? carbs;
  @override
  @JsonKey(name: 'proteins')
  final double? proteins;
  @override
  @JsonKey(name: 'fats')
  final double? fats;

  @override
  String toString() {
    return 'MacronutrientGraphModel(date: $date, carbs: $carbs, proteins: $proteins, fats: $fats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacronutrientGraphModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.fats, fats) || other.fats == fats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, carbs, proteins, fats);

  /// Create a copy of MacronutrientGraphModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacronutrientGraphModelImplCopyWith<_$MacronutrientGraphModelImpl>
      get copyWith => __$$MacronutrientGraphModelImplCopyWithImpl<
          _$MacronutrientGraphModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacronutrientGraphModelImplToJson(
      this,
    );
  }
}

abstract class _MacronutrientGraphModel implements MacronutrientGraphModel {
  const factory _MacronutrientGraphModel(
          {@JsonKey(name: 'date') final String? date,
          @JsonKey(name: 'carbs') final double? carbs,
          @JsonKey(name: 'proteins') final double? proteins,
          @JsonKey(name: 'fats') final double? fats}) =
      _$MacronutrientGraphModelImpl;

  factory _MacronutrientGraphModel.fromJson(Map<String, dynamic> json) =
      _$MacronutrientGraphModelImpl.fromJson;

  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'carbs')
  double? get carbs;
  @override
  @JsonKey(name: 'proteins')
  double? get proteins;
  @override
  @JsonKey(name: 'fats')
  double? get fats;

  /// Create a copy of MacronutrientGraphModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacronutrientGraphModelImplCopyWith<_$MacronutrientGraphModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TodayMacronutrientModel _$TodayMacronutrientModelFromJson(
    Map<String, dynamic> json) {
  return _TodayMacronutrientModel.fromJson(json);
}

/// @nodoc
mixin _$TodayMacronutrientModel {
  @JsonKey(name: 'carbs')
  MacroDetailModel? get carbs => throw _privateConstructorUsedError;
  @JsonKey(name: 'proteins')
  MacroDetailModel? get proteins => throw _privateConstructorUsedError;
  @JsonKey(name: 'fats')
  MacroDetailModel? get fats => throw _privateConstructorUsedError;

  /// Serializes this TodayMacronutrientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayMacronutrientModelCopyWith<TodayMacronutrientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayMacronutrientModelCopyWith<$Res> {
  factory $TodayMacronutrientModelCopyWith(TodayMacronutrientModel value,
          $Res Function(TodayMacronutrientModel) then) =
      _$TodayMacronutrientModelCopyWithImpl<$Res, TodayMacronutrientModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'carbs') MacroDetailModel? carbs,
      @JsonKey(name: 'proteins') MacroDetailModel? proteins,
      @JsonKey(name: 'fats') MacroDetailModel? fats});

  $MacroDetailModelCopyWith<$Res>? get carbs;
  $MacroDetailModelCopyWith<$Res>? get proteins;
  $MacroDetailModelCopyWith<$Res>? get fats;
}

/// @nodoc
class _$TodayMacronutrientModelCopyWithImpl<$Res,
        $Val extends TodayMacronutrientModel>
    implements $TodayMacronutrientModelCopyWith<$Res> {
  _$TodayMacronutrientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carbs = freezed,
    Object? proteins = freezed,
    Object? fats = freezed,
  }) {
    return _then(_value.copyWith(
      carbs: freezed == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as MacroDetailModel?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as MacroDetailModel?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as MacroDetailModel?,
    ) as $Val);
  }

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacroDetailModelCopyWith<$Res>? get carbs {
    if (_value.carbs == null) {
      return null;
    }

    return $MacroDetailModelCopyWith<$Res>(_value.carbs!, (value) {
      return _then(_value.copyWith(carbs: value) as $Val);
    });
  }

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacroDetailModelCopyWith<$Res>? get proteins {
    if (_value.proteins == null) {
      return null;
    }

    return $MacroDetailModelCopyWith<$Res>(_value.proteins!, (value) {
      return _then(_value.copyWith(proteins: value) as $Val);
    });
  }

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacroDetailModelCopyWith<$Res>? get fats {
    if (_value.fats == null) {
      return null;
    }

    return $MacroDetailModelCopyWith<$Res>(_value.fats!, (value) {
      return _then(_value.copyWith(fats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodayMacronutrientModelImplCopyWith<$Res>
    implements $TodayMacronutrientModelCopyWith<$Res> {
  factory _$$TodayMacronutrientModelImplCopyWith(
          _$TodayMacronutrientModelImpl value,
          $Res Function(_$TodayMacronutrientModelImpl) then) =
      __$$TodayMacronutrientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'carbs') MacroDetailModel? carbs,
      @JsonKey(name: 'proteins') MacroDetailModel? proteins,
      @JsonKey(name: 'fats') MacroDetailModel? fats});

  @override
  $MacroDetailModelCopyWith<$Res>? get carbs;
  @override
  $MacroDetailModelCopyWith<$Res>? get proteins;
  @override
  $MacroDetailModelCopyWith<$Res>? get fats;
}

/// @nodoc
class __$$TodayMacronutrientModelImplCopyWithImpl<$Res>
    extends _$TodayMacronutrientModelCopyWithImpl<$Res,
        _$TodayMacronutrientModelImpl>
    implements _$$TodayMacronutrientModelImplCopyWith<$Res> {
  __$$TodayMacronutrientModelImplCopyWithImpl(
      _$TodayMacronutrientModelImpl _value,
      $Res Function(_$TodayMacronutrientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carbs = freezed,
    Object? proteins = freezed,
    Object? fats = freezed,
  }) {
    return _then(_$TodayMacronutrientModelImpl(
      carbs: freezed == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as MacroDetailModel?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as MacroDetailModel?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as MacroDetailModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayMacronutrientModelImpl implements _TodayMacronutrientModel {
  const _$TodayMacronutrientModelImpl(
      {@JsonKey(name: 'carbs') this.carbs,
      @JsonKey(name: 'proteins') this.proteins,
      @JsonKey(name: 'fats') this.fats});

  factory _$TodayMacronutrientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayMacronutrientModelImplFromJson(json);

  @override
  @JsonKey(name: 'carbs')
  final MacroDetailModel? carbs;
  @override
  @JsonKey(name: 'proteins')
  final MacroDetailModel? proteins;
  @override
  @JsonKey(name: 'fats')
  final MacroDetailModel? fats;

  @override
  String toString() {
    return 'TodayMacronutrientModel(carbs: $carbs, proteins: $proteins, fats: $fats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayMacronutrientModelImpl &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.fats, fats) || other.fats == fats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, carbs, proteins, fats);

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayMacronutrientModelImplCopyWith<_$TodayMacronutrientModelImpl>
      get copyWith => __$$TodayMacronutrientModelImplCopyWithImpl<
          _$TodayMacronutrientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayMacronutrientModelImplToJson(
      this,
    );
  }
}

abstract class _TodayMacronutrientModel implements TodayMacronutrientModel {
  const factory _TodayMacronutrientModel(
          {@JsonKey(name: 'carbs') final MacroDetailModel? carbs,
          @JsonKey(name: 'proteins') final MacroDetailModel? proteins,
          @JsonKey(name: 'fats') final MacroDetailModel? fats}) =
      _$TodayMacronutrientModelImpl;

  factory _TodayMacronutrientModel.fromJson(Map<String, dynamic> json) =
      _$TodayMacronutrientModelImpl.fromJson;

  @override
  @JsonKey(name: 'carbs')
  MacroDetailModel? get carbs;
  @override
  @JsonKey(name: 'proteins')
  MacroDetailModel? get proteins;
  @override
  @JsonKey(name: 'fats')
  MacroDetailModel? get fats;

  /// Create a copy of TodayMacronutrientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayMacronutrientModelImplCopyWith<_$TodayMacronutrientModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MacroDetailModel _$MacroDetailModelFromJson(Map<String, dynamic> json) {
  return _MacroDetailModel.fromJson(json);
}

/// @nodoc
mixin _$MacroDetailModel {
  @JsonKey(name: 'value')
  double? get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage')
  double? get percentage => throw _privateConstructorUsedError;

  /// Serializes this MacroDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MacroDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacroDetailModelCopyWith<MacroDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacroDetailModelCopyWith<$Res> {
  factory $MacroDetailModelCopyWith(
          MacroDetailModel value, $Res Function(MacroDetailModel) then) =
      _$MacroDetailModelCopyWithImpl<$Res, MacroDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'value') double? value,
      @JsonKey(name: 'percentage') double? percentage});
}

/// @nodoc
class _$MacroDetailModelCopyWithImpl<$Res, $Val extends MacroDetailModel>
    implements $MacroDetailModelCopyWith<$Res> {
  _$MacroDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MacroDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MacroDetailModelImplCopyWith<$Res>
    implements $MacroDetailModelCopyWith<$Res> {
  factory _$$MacroDetailModelImplCopyWith(_$MacroDetailModelImpl value,
          $Res Function(_$MacroDetailModelImpl) then) =
      __$$MacroDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'value') double? value,
      @JsonKey(name: 'percentage') double? percentage});
}

/// @nodoc
class __$$MacroDetailModelImplCopyWithImpl<$Res>
    extends _$MacroDetailModelCopyWithImpl<$Res, _$MacroDetailModelImpl>
    implements _$$MacroDetailModelImplCopyWith<$Res> {
  __$$MacroDetailModelImplCopyWithImpl(_$MacroDetailModelImpl _value,
      $Res Function(_$MacroDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MacroDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? percentage = freezed,
  }) {
    return _then(_$MacroDetailModelImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
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
class _$MacroDetailModelImpl implements _MacroDetailModel {
  const _$MacroDetailModelImpl(
      {@JsonKey(name: 'value') this.value,
      @JsonKey(name: 'percentage') this.percentage});

  factory _$MacroDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacroDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'value')
  final double? value;
  @override
  @JsonKey(name: 'percentage')
  final double? percentage;

  @override
  String toString() {
    return 'MacroDetailModel(value: $value, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacroDetailModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, percentage);

  /// Create a copy of MacroDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacroDetailModelImplCopyWith<_$MacroDetailModelImpl> get copyWith =>
      __$$MacroDetailModelImplCopyWithImpl<_$MacroDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacroDetailModelImplToJson(
      this,
    );
  }
}

abstract class _MacroDetailModel implements MacroDetailModel {
  const factory _MacroDetailModel(
          {@JsonKey(name: 'value') final double? value,
          @JsonKey(name: 'percentage') final double? percentage}) =
      _$MacroDetailModelImpl;

  factory _MacroDetailModel.fromJson(Map<String, dynamic> json) =
      _$MacroDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'value')
  double? get value;
  @override
  @JsonKey(name: 'percentage')
  double? get percentage;

  /// Create a copy of MacroDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacroDetailModelImplCopyWith<_$MacroDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
