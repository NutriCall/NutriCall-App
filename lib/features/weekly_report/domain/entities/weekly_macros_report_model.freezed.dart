// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_macros_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyMacrosReportModel _$WeeklyMacrosReportModelFromJson(
    Map<String, dynamic> json) {
  return _WeeklyMacrosReportModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyMacrosReportModel {
  List<MacroItem> get items => throw _privateConstructorUsedError;

  /// Serializes this WeeklyMacrosReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyMacrosReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyMacrosReportModelCopyWith<WeeklyMacrosReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyMacrosReportModelCopyWith<$Res> {
  factory $WeeklyMacrosReportModelCopyWith(WeeklyMacrosReportModel value,
          $Res Function(WeeklyMacrosReportModel) then) =
      _$WeeklyMacrosReportModelCopyWithImpl<$Res, WeeklyMacrosReportModel>;
  @useResult
  $Res call({List<MacroItem> items});
}

/// @nodoc
class _$WeeklyMacrosReportModelCopyWithImpl<$Res,
        $Val extends WeeklyMacrosReportModel>
    implements $WeeklyMacrosReportModelCopyWith<$Res> {
  _$WeeklyMacrosReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyMacrosReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MacroItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyMacrosReportModelImplCopyWith<$Res>
    implements $WeeklyMacrosReportModelCopyWith<$Res> {
  factory _$$WeeklyMacrosReportModelImplCopyWith(
          _$WeeklyMacrosReportModelImpl value,
          $Res Function(_$WeeklyMacrosReportModelImpl) then) =
      __$$WeeklyMacrosReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MacroItem> items});
}

/// @nodoc
class __$$WeeklyMacrosReportModelImplCopyWithImpl<$Res>
    extends _$WeeklyMacrosReportModelCopyWithImpl<$Res,
        _$WeeklyMacrosReportModelImpl>
    implements _$$WeeklyMacrosReportModelImplCopyWith<$Res> {
  __$$WeeklyMacrosReportModelImplCopyWithImpl(
      _$WeeklyMacrosReportModelImpl _value,
      $Res Function(_$WeeklyMacrosReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyMacrosReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$WeeklyMacrosReportModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MacroItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyMacrosReportModelImpl implements _WeeklyMacrosReportModel {
  const _$WeeklyMacrosReportModelImpl({required final List<MacroItem> items})
      : _items = items;

  factory _$WeeklyMacrosReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyMacrosReportModelImplFromJson(json);

  final List<MacroItem> _items;
  @override
  List<MacroItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'WeeklyMacrosReportModel(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyMacrosReportModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of WeeklyMacrosReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyMacrosReportModelImplCopyWith<_$WeeklyMacrosReportModelImpl>
      get copyWith => __$$WeeklyMacrosReportModelImplCopyWithImpl<
          _$WeeklyMacrosReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyMacrosReportModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyMacrosReportModel implements WeeklyMacrosReportModel {
  const factory _WeeklyMacrosReportModel(
      {required final List<MacroItem> items}) = _$WeeklyMacrosReportModelImpl;

  factory _WeeklyMacrosReportModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyMacrosReportModelImpl.fromJson;

  @override
  List<MacroItem> get items;

  /// Create a copy of WeeklyMacrosReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyMacrosReportModelImplCopyWith<_$WeeklyMacrosReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MacroItem _$MacroItemFromJson(Map<String, dynamic> json) {
  return _MacroItem.fromJson(json);
}

/// @nodoc
mixin _$MacroItem {
  String get name => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this MacroItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MacroItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacroItemCopyWith<MacroItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacroItemCopyWith<$Res> {
  factory $MacroItemCopyWith(MacroItem value, $Res Function(MacroItem) then) =
      _$MacroItemCopyWithImpl<$Res, MacroItem>;
  @useResult
  $Res call({String name, double total, double percentage});
}

/// @nodoc
class _$MacroItemCopyWithImpl<$Res, $Val extends MacroItem>
    implements $MacroItemCopyWith<$Res> {
  _$MacroItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MacroItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? total = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MacroItemImplCopyWith<$Res>
    implements $MacroItemCopyWith<$Res> {
  factory _$$MacroItemImplCopyWith(
          _$MacroItemImpl value, $Res Function(_$MacroItemImpl) then) =
      __$$MacroItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double total, double percentage});
}

/// @nodoc
class __$$MacroItemImplCopyWithImpl<$Res>
    extends _$MacroItemCopyWithImpl<$Res, _$MacroItemImpl>
    implements _$$MacroItemImplCopyWith<$Res> {
  __$$MacroItemImplCopyWithImpl(
      _$MacroItemImpl _value, $Res Function(_$MacroItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MacroItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? total = null,
    Object? percentage = null,
  }) {
    return _then(_$MacroItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MacroItemImpl implements _MacroItem {
  const _$MacroItemImpl(
      {required this.name, required this.total, required this.percentage});

  factory _$MacroItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacroItemImplFromJson(json);

  @override
  final String name;
  @override
  final double total;
  @override
  final double percentage;

  @override
  String toString() {
    return 'MacroItem(name: $name, total: $total, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacroItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, total, percentage);

  /// Create a copy of MacroItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacroItemImplCopyWith<_$MacroItemImpl> get copyWith =>
      __$$MacroItemImplCopyWithImpl<_$MacroItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacroItemImplToJson(
      this,
    );
  }
}

abstract class _MacroItem implements MacroItem {
  const factory _MacroItem(
      {required final String name,
      required final double total,
      required final double percentage}) = _$MacroItemImpl;

  factory _MacroItem.fromJson(Map<String, dynamic> json) =
      _$MacroItemImpl.fromJson;

  @override
  String get name;
  @override
  double get total;
  @override
  double get percentage;

  /// Create a copy of MacroItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacroItemImplCopyWith<_$MacroItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
