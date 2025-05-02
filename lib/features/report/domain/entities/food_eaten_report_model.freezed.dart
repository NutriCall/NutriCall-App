// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_eaten_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodEatenReportModel _$FoodEatenReportModelFromJson(Map<String, dynamic> json) {
  return _FoodEatenReportModel.fromJson(json);
}

/// @nodoc
mixin _$FoodEatenReportModel {
  @JsonKey(name: 'items')
  List<FoodItemModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  FoodEatenTotalModel? get total => throw _privateConstructorUsedError;

  /// Serializes this FoodEatenReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodEatenReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodEatenReportModelCopyWith<FoodEatenReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEatenReportModelCopyWith<$Res> {
  factory $FoodEatenReportModelCopyWith(FoodEatenReportModel value,
          $Res Function(FoodEatenReportModel) then) =
      _$FoodEatenReportModelCopyWithImpl<$Res, FoodEatenReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<FoodItemModel>? items,
      @JsonKey(name: 'total') FoodEatenTotalModel? total});

  $FoodEatenTotalModelCopyWith<$Res>? get total;
}

/// @nodoc
class _$FoodEatenReportModelCopyWithImpl<$Res,
        $Val extends FoodEatenReportModel>
    implements $FoodEatenReportModelCopyWith<$Res> {
  _$FoodEatenReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodEatenReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItemModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as FoodEatenTotalModel?,
    ) as $Val);
  }

  /// Create a copy of FoodEatenReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodEatenTotalModelCopyWith<$Res>? get total {
    if (_value.total == null) {
      return null;
    }

    return $FoodEatenTotalModelCopyWith<$Res>(_value.total!, (value) {
      return _then(_value.copyWith(total: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodEatenReportModelImplCopyWith<$Res>
    implements $FoodEatenReportModelCopyWith<$Res> {
  factory _$$FoodEatenReportModelImplCopyWith(_$FoodEatenReportModelImpl value,
          $Res Function(_$FoodEatenReportModelImpl) then) =
      __$$FoodEatenReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<FoodItemModel>? items,
      @JsonKey(name: 'total') FoodEatenTotalModel? total});

  @override
  $FoodEatenTotalModelCopyWith<$Res>? get total;
}

/// @nodoc
class __$$FoodEatenReportModelImplCopyWithImpl<$Res>
    extends _$FoodEatenReportModelCopyWithImpl<$Res, _$FoodEatenReportModelImpl>
    implements _$$FoodEatenReportModelImplCopyWith<$Res> {
  __$$FoodEatenReportModelImplCopyWithImpl(_$FoodEatenReportModelImpl _value,
      $Res Function(_$FoodEatenReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodEatenReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? total = freezed,
  }) {
    return _then(_$FoodEatenReportModelImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItemModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as FoodEatenTotalModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodEatenReportModelImpl implements _FoodEatenReportModel {
  const _$FoodEatenReportModelImpl(
      {@JsonKey(name: 'items') final List<FoodItemModel>? items,
      @JsonKey(name: 'total') this.total})
      : _items = items;

  factory _$FoodEatenReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodEatenReportModelImplFromJson(json);

  final List<FoodItemModel>? _items;
  @override
  @JsonKey(name: 'items')
  List<FoodItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total')
  final FoodEatenTotalModel? total;

  @override
  String toString() {
    return 'FoodEatenReportModel(items: $items, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodEatenReportModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), total);

  /// Create a copy of FoodEatenReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodEatenReportModelImplCopyWith<_$FoodEatenReportModelImpl>
      get copyWith =>
          __$$FoodEatenReportModelImplCopyWithImpl<_$FoodEatenReportModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodEatenReportModelImplToJson(
      this,
    );
  }
}

abstract class _FoodEatenReportModel implements FoodEatenReportModel {
  const factory _FoodEatenReportModel(
          {@JsonKey(name: 'items') final List<FoodItemModel>? items,
          @JsonKey(name: 'total') final FoodEatenTotalModel? total}) =
      _$FoodEatenReportModelImpl;

  factory _FoodEatenReportModel.fromJson(Map<String, dynamic> json) =
      _$FoodEatenReportModelImpl.fromJson;

  @override
  @JsonKey(name: 'items')
  List<FoodItemModel>? get items;
  @override
  @JsonKey(name: 'total')
  FoodEatenTotalModel? get total;

  /// Create a copy of FoodEatenReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodEatenReportModelImplCopyWith<_$FoodEatenReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FoodItemModel _$FoodItemModelFromJson(Map<String, dynamic> json) {
  return _FoodItemModel.fromJson(json);
}

/// @nodoc
mixin _$FoodItemModel {
  @JsonKey(name: 'nama_bahan')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_calories')
  double? get calories => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_fats')
  double? get fats => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_carbs')
  double? get carbs => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_proteins')
  double? get proteins => throw _privateConstructorUsedError;

  /// Serializes this FoodItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodItemModelCopyWith<FoodItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemModelCopyWith<$Res> {
  factory $FoodItemModelCopyWith(
          FoodItemModel value, $Res Function(FoodItemModel) then) =
      _$FoodItemModelCopyWithImpl<$Res, FoodItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_bahan') String? name,
      @JsonKey(name: 'count') int? count,
      @JsonKey(name: 'total_calories') double? calories,
      @JsonKey(name: 'total_fats') double? fats,
      @JsonKey(name: 'total_carbs') double? carbs,
      @JsonKey(name: 'total_proteins') double? proteins});
}

/// @nodoc
class _$FoodItemModelCopyWithImpl<$Res, $Val extends FoodItemModel>
    implements $FoodItemModelCopyWith<$Res> {
  _$FoodItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? calories = freezed,
    Object? fats = freezed,
    Object? carbs = freezed,
    Object? proteins = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double?,
      carbs: freezed == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodItemModelImplCopyWith<$Res>
    implements $FoodItemModelCopyWith<$Res> {
  factory _$$FoodItemModelImplCopyWith(
          _$FoodItemModelImpl value, $Res Function(_$FoodItemModelImpl) then) =
      __$$FoodItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_bahan') String? name,
      @JsonKey(name: 'count') int? count,
      @JsonKey(name: 'total_calories') double? calories,
      @JsonKey(name: 'total_fats') double? fats,
      @JsonKey(name: 'total_carbs') double? carbs,
      @JsonKey(name: 'total_proteins') double? proteins});
}

/// @nodoc
class __$$FoodItemModelImplCopyWithImpl<$Res>
    extends _$FoodItemModelCopyWithImpl<$Res, _$FoodItemModelImpl>
    implements _$$FoodItemModelImplCopyWith<$Res> {
  __$$FoodItemModelImplCopyWithImpl(
      _$FoodItemModelImpl _value, $Res Function(_$FoodItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? count = freezed,
    Object? calories = freezed,
    Object? fats = freezed,
    Object? carbs = freezed,
    Object? proteins = freezed,
  }) {
    return _then(_$FoodItemModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double?,
      fats: freezed == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double?,
      carbs: freezed == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double?,
      proteins: freezed == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodItemModelImpl implements _FoodItemModel {
  const _$FoodItemModelImpl(
      {@JsonKey(name: 'nama_bahan') this.name,
      @JsonKey(name: 'count') this.count,
      @JsonKey(name: 'total_calories') this.calories,
      @JsonKey(name: 'total_fats') this.fats,
      @JsonKey(name: 'total_carbs') this.carbs,
      @JsonKey(name: 'total_proteins') this.proteins});

  factory _$FoodItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'nama_bahan')
  final String? name;
  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'total_calories')
  final double? calories;
  @override
  @JsonKey(name: 'total_fats')
  final double? fats;
  @override
  @JsonKey(name: 'total_carbs')
  final double? carbs;
  @override
  @JsonKey(name: 'total_proteins')
  final double? proteins;

  @override
  String toString() {
    return 'FoodItemModel(name: $name, count: $count, calories: $calories, fats: $fats, carbs: $carbs, proteins: $proteins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodItemModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, count, calories, fats, carbs, proteins);

  /// Create a copy of FoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodItemModelImplCopyWith<_$FoodItemModelImpl> get copyWith =>
      __$$FoodItemModelImplCopyWithImpl<_$FoodItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodItemModelImplToJson(
      this,
    );
  }
}

abstract class _FoodItemModel implements FoodItemModel {
  const factory _FoodItemModel(
          {@JsonKey(name: 'nama_bahan') final String? name,
          @JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'total_calories') final double? calories,
          @JsonKey(name: 'total_fats') final double? fats,
          @JsonKey(name: 'total_carbs') final double? carbs,
          @JsonKey(name: 'total_proteins') final double? proteins}) =
      _$FoodItemModelImpl;

  factory _FoodItemModel.fromJson(Map<String, dynamic> json) =
      _$FoodItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'nama_bahan')
  String? get name;
  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'total_calories')
  double? get calories;
  @override
  @JsonKey(name: 'total_fats')
  double? get fats;
  @override
  @JsonKey(name: 'total_carbs')
  double? get carbs;
  @override
  @JsonKey(name: 'total_proteins')
  double? get proteins;

  /// Create a copy of FoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodItemModelImplCopyWith<_$FoodItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FoodEatenTotalModel _$FoodEatenTotalModelFromJson(Map<String, dynamic> json) {
  return _FoodEatenTotalModel.fromJson(json);
}

/// @nodoc
mixin _$FoodEatenTotalModel {
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_calories')
  double? get totalCalories => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_fats')
  double? get totalFats => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_carbs')
  double? get totalCarbs => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_proteins')
  double? get totalProteins => throw _privateConstructorUsedError;

  /// Serializes this FoodEatenTotalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodEatenTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodEatenTotalModelCopyWith<FoodEatenTotalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEatenTotalModelCopyWith<$Res> {
  factory $FoodEatenTotalModelCopyWith(
          FoodEatenTotalModel value, $Res Function(FoodEatenTotalModel) then) =
      _$FoodEatenTotalModelCopyWithImpl<$Res, FoodEatenTotalModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'total_calories') double? totalCalories,
      @JsonKey(name: 'total_fats') double? totalFats,
      @JsonKey(name: 'total_carbs') double? totalCarbs,
      @JsonKey(name: 'total_proteins') double? totalProteins});
}

/// @nodoc
class _$FoodEatenTotalModelCopyWithImpl<$Res, $Val extends FoodEatenTotalModel>
    implements $FoodEatenTotalModelCopyWith<$Res> {
  _$FoodEatenTotalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodEatenTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? totalCalories = freezed,
    Object? totalFats = freezed,
    Object? totalCarbs = freezed,
    Object? totalProteins = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCalories: freezed == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double?,
      totalFats: freezed == totalFats
          ? _value.totalFats
          : totalFats // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCarbs: freezed == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProteins: freezed == totalProteins
          ? _value.totalProteins
          : totalProteins // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodEatenTotalModelImplCopyWith<$Res>
    implements $FoodEatenTotalModelCopyWith<$Res> {
  factory _$$FoodEatenTotalModelImplCopyWith(_$FoodEatenTotalModelImpl value,
          $Res Function(_$FoodEatenTotalModelImpl) then) =
      __$$FoodEatenTotalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int? count,
      @JsonKey(name: 'total_calories') double? totalCalories,
      @JsonKey(name: 'total_fats') double? totalFats,
      @JsonKey(name: 'total_carbs') double? totalCarbs,
      @JsonKey(name: 'total_proteins') double? totalProteins});
}

/// @nodoc
class __$$FoodEatenTotalModelImplCopyWithImpl<$Res>
    extends _$FoodEatenTotalModelCopyWithImpl<$Res, _$FoodEatenTotalModelImpl>
    implements _$$FoodEatenTotalModelImplCopyWith<$Res> {
  __$$FoodEatenTotalModelImplCopyWithImpl(_$FoodEatenTotalModelImpl _value,
      $Res Function(_$FoodEatenTotalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodEatenTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? totalCalories = freezed,
    Object? totalFats = freezed,
    Object? totalCarbs = freezed,
    Object? totalProteins = freezed,
  }) {
    return _then(_$FoodEatenTotalModelImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCalories: freezed == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double?,
      totalFats: freezed == totalFats
          ? _value.totalFats
          : totalFats // ignore: cast_nullable_to_non_nullable
              as double?,
      totalCarbs: freezed == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProteins: freezed == totalProteins
          ? _value.totalProteins
          : totalProteins // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodEatenTotalModelImpl implements _FoodEatenTotalModel {
  const _$FoodEatenTotalModelImpl(
      {@JsonKey(name: 'count') this.count,
      @JsonKey(name: 'total_calories') this.totalCalories,
      @JsonKey(name: 'total_fats') this.totalFats,
      @JsonKey(name: 'total_carbs') this.totalCarbs,
      @JsonKey(name: 'total_proteins') this.totalProteins});

  factory _$FoodEatenTotalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodEatenTotalModelImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'total_calories')
  final double? totalCalories;
  @override
  @JsonKey(name: 'total_fats')
  final double? totalFats;
  @override
  @JsonKey(name: 'total_carbs')
  final double? totalCarbs;
  @override
  @JsonKey(name: 'total_proteins')
  final double? totalProteins;

  @override
  String toString() {
    return 'FoodEatenTotalModel(count: $count, totalCalories: $totalCalories, totalFats: $totalFats, totalCarbs: $totalCarbs, totalProteins: $totalProteins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodEatenTotalModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalFats, totalFats) ||
                other.totalFats == totalFats) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalProteins, totalProteins) ||
                other.totalProteins == totalProteins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, totalCalories, totalFats, totalCarbs, totalProteins);

  /// Create a copy of FoodEatenTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodEatenTotalModelImplCopyWith<_$FoodEatenTotalModelImpl> get copyWith =>
      __$$FoodEatenTotalModelImplCopyWithImpl<_$FoodEatenTotalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodEatenTotalModelImplToJson(
      this,
    );
  }
}

abstract class _FoodEatenTotalModel implements FoodEatenTotalModel {
  const factory _FoodEatenTotalModel(
          {@JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'total_calories') final double? totalCalories,
          @JsonKey(name: 'total_fats') final double? totalFats,
          @JsonKey(name: 'total_carbs') final double? totalCarbs,
          @JsonKey(name: 'total_proteins') final double? totalProteins}) =
      _$FoodEatenTotalModelImpl;

  factory _FoodEatenTotalModel.fromJson(Map<String, dynamic> json) =
      _$FoodEatenTotalModelImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'total_calories')
  double? get totalCalories;
  @override
  @JsonKey(name: 'total_fats')
  double? get totalFats;
  @override
  @JsonKey(name: 'total_carbs')
  double? get totalCarbs;
  @override
  @JsonKey(name: 'total_proteins')
  double? get totalProteins;

  /// Create a copy of FoodEatenTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodEatenTotalModelImplCopyWith<_$FoodEatenTotalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
