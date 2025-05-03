// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealPlanModel _$MealPlanModelFromJson(Map<String, dynamic> json) {
  return _MealPlanModel.fromJson(json);
}

/// @nodoc
mixin _$MealPlanModel {
  String get type => throw _privateConstructorUsedError;
  List<Meal> get meals => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_energi')
  double get totalEnergi => throw _privateConstructorUsedError;

  /// Serializes this MealPlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealPlanModelCopyWith<MealPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanModelCopyWith<$Res> {
  factory $MealPlanModelCopyWith(
          MealPlanModel value, $Res Function(MealPlanModel) then) =
      _$MealPlanModelCopyWithImpl<$Res, MealPlanModel>;
  @useResult
  $Res call(
      {String type,
      List<Meal> meals,
      @JsonKey(name: 'total_energi') double totalEnergi});
}

/// @nodoc
class _$MealPlanModelCopyWithImpl<$Res, $Val extends MealPlanModel>
    implements $MealPlanModelCopyWith<$Res> {
  _$MealPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? meals = null,
    Object? totalEnergi = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      totalEnergi: null == totalEnergi
          ? _value.totalEnergi
          : totalEnergi // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealPlanModelImplCopyWith<$Res>
    implements $MealPlanModelCopyWith<$Res> {
  factory _$$MealPlanModelImplCopyWith(
          _$MealPlanModelImpl value, $Res Function(_$MealPlanModelImpl) then) =
      __$$MealPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      List<Meal> meals,
      @JsonKey(name: 'total_energi') double totalEnergi});
}

/// @nodoc
class __$$MealPlanModelImplCopyWithImpl<$Res>
    extends _$MealPlanModelCopyWithImpl<$Res, _$MealPlanModelImpl>
    implements _$$MealPlanModelImplCopyWith<$Res> {
  __$$MealPlanModelImplCopyWithImpl(
      _$MealPlanModelImpl _value, $Res Function(_$MealPlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? meals = null,
    Object? totalEnergi = null,
  }) {
    return _then(_$MealPlanModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      totalEnergi: null == totalEnergi
          ? _value.totalEnergi
          : totalEnergi // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealPlanModelImpl implements _MealPlanModel {
  const _$MealPlanModelImpl(
      {required this.type,
      required final List<Meal> meals,
      @JsonKey(name: 'total_energi') required this.totalEnergi})
      : _meals = meals;

  factory _$MealPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealPlanModelImplFromJson(json);

  @override
  final String type;
  final List<Meal> _meals;
  @override
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  @JsonKey(name: 'total_energi')
  final double totalEnergi;

  @override
  String toString() {
    return 'MealPlanModel(type: $type, meals: $meals, totalEnergi: $totalEnergi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            (identical(other.totalEnergi, totalEnergi) ||
                other.totalEnergi == totalEnergi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type,
      const DeepCollectionEquality().hash(_meals), totalEnergi);

  /// Create a copy of MealPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanModelImplCopyWith<_$MealPlanModelImpl> get copyWith =>
      __$$MealPlanModelImplCopyWithImpl<_$MealPlanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealPlanModelImplToJson(
      this,
    );
  }
}

abstract class _MealPlanModel implements MealPlanModel {
  const factory _MealPlanModel(
          {required final String type,
          required final List<Meal> meals,
          @JsonKey(name: 'total_energi') required final double totalEnergi}) =
      _$MealPlanModelImpl;

  factory _MealPlanModel.fromJson(Map<String, dynamic> json) =
      _$MealPlanModelImpl.fromJson;

  @override
  String get type;
  @override
  List<Meal> get meals;
  @override
  @JsonKey(name: 'total_energi')
  double get totalEnergi;

  /// Create a copy of MealPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealPlanModelImplCopyWith<_$MealPlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meal _$MealFromJson(Map<String, dynamic> json) {
  return _Meal.fromJson(json);
}

/// @nodoc
mixin _$Meal {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'composition_id')
  int get compositionId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_composition')
  FoodComposition get foodComposition => throw _privateConstructorUsedError;

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealCopyWith<Meal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) then) =
      _$MealCopyWithImpl<$Res, Meal>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'composition_id') int compositionId,
      String date,
      String type,
      @JsonKey(name: 'food_composition') FoodComposition foodComposition});

  $FoodCompositionCopyWith<$Res> get foodComposition;
}

/// @nodoc
class _$MealCopyWithImpl<$Res, $Val extends Meal>
    implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? compositionId = null,
    Object? date = null,
    Object? type = null,
    Object? foodComposition = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      compositionId: null == compositionId
          ? _value.compositionId
          : compositionId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      foodComposition: null == foodComposition
          ? _value.foodComposition
          : foodComposition // ignore: cast_nullable_to_non_nullable
              as FoodComposition,
    ) as $Val);
  }

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodCompositionCopyWith<$Res> get foodComposition {
    return $FoodCompositionCopyWith<$Res>(_value.foodComposition, (value) {
      return _then(_value.copyWith(foodComposition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealImplCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$$MealImplCopyWith(
          _$MealImpl value, $Res Function(_$MealImpl) then) =
      __$$MealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'composition_id') int compositionId,
      String date,
      String type,
      @JsonKey(name: 'food_composition') FoodComposition foodComposition});

  @override
  $FoodCompositionCopyWith<$Res> get foodComposition;
}

/// @nodoc
class __$$MealImplCopyWithImpl<$Res>
    extends _$MealCopyWithImpl<$Res, _$MealImpl>
    implements _$$MealImplCopyWith<$Res> {
  __$$MealImplCopyWithImpl(_$MealImpl _value, $Res Function(_$MealImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? compositionId = null,
    Object? date = null,
    Object? type = null,
    Object? foodComposition = null,
  }) {
    return _then(_$MealImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      compositionId: null == compositionId
          ? _value.compositionId
          : compositionId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      foodComposition: null == foodComposition
          ? _value.foodComposition
          : foodComposition // ignore: cast_nullable_to_non_nullable
              as FoodComposition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealImpl implements _Meal {
  const _$MealImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'composition_id') required this.compositionId,
      required this.date,
      required this.type,
      @JsonKey(name: 'food_composition') required this.foodComposition});

  factory _$MealImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'composition_id')
  final int compositionId;
  @override
  final String date;
  @override
  final String type;
  @override
  @JsonKey(name: 'food_composition')
  final FoodComposition foodComposition;

  @override
  String toString() {
    return 'Meal(id: $id, userId: $userId, compositionId: $compositionId, date: $date, type: $type, foodComposition: $foodComposition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.compositionId, compositionId) ||
                other.compositionId == compositionId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.foodComposition, foodComposition) ||
                other.foodComposition == foodComposition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, compositionId, date, type, foodComposition);

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealImplCopyWith<_$MealImpl> get copyWith =>
      __$$MealImplCopyWithImpl<_$MealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealImplToJson(
      this,
    );
  }
}

abstract class _Meal implements Meal {
  const factory _Meal(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'composition_id') required final int compositionId,
      required final String date,
      required final String type,
      @JsonKey(name: 'food_composition')
      required final FoodComposition foodComposition}) = _$MealImpl;

  factory _Meal.fromJson(Map<String, dynamic> json) = _$MealImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'composition_id')
  int get compositionId;
  @override
  String get date;
  @override
  String get type;
  @override
  @JsonKey(name: 'food_composition')
  FoodComposition get foodComposition;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealImplCopyWith<_$MealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FoodComposition _$FoodCompositionFromJson(Map<String, dynamic> json) {
  return _FoodComposition.fromJson(json);
}

/// @nodoc
mixin _$FoodComposition {
  @JsonKey(name: 'nama_bahan')
  String get namaBahan => throw _privateConstructorUsedError;
  double get energi => throw _privateConstructorUsedError;
  double get karbohidrat => throw _privateConstructorUsedError;
  double get protein => throw _privateConstructorUsedError;
  double get lemak => throw _privateConstructorUsedError;

  /// Serializes this FoodComposition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodComposition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodCompositionCopyWith<FoodComposition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCompositionCopyWith<$Res> {
  factory $FoodCompositionCopyWith(
          FoodComposition value, $Res Function(FoodComposition) then) =
      _$FoodCompositionCopyWithImpl<$Res, FoodComposition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_bahan') String namaBahan,
      double energi,
      double karbohidrat,
      double protein,
      double lemak});
}

/// @nodoc
class _$FoodCompositionCopyWithImpl<$Res, $Val extends FoodComposition>
    implements $FoodCompositionCopyWith<$Res> {
  _$FoodCompositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodComposition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namaBahan = null,
    Object? energi = null,
    Object? karbohidrat = null,
    Object? protein = null,
    Object? lemak = null,
  }) {
    return _then(_value.copyWith(
      namaBahan: null == namaBahan
          ? _value.namaBahan
          : namaBahan // ignore: cast_nullable_to_non_nullable
              as String,
      energi: null == energi
          ? _value.energi
          : energi // ignore: cast_nullable_to_non_nullable
              as double,
      karbohidrat: null == karbohidrat
          ? _value.karbohidrat
          : karbohidrat // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      lemak: null == lemak
          ? _value.lemak
          : lemak // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodCompositionImplCopyWith<$Res>
    implements $FoodCompositionCopyWith<$Res> {
  factory _$$FoodCompositionImplCopyWith(_$FoodCompositionImpl value,
          $Res Function(_$FoodCompositionImpl) then) =
      __$$FoodCompositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nama_bahan') String namaBahan,
      double energi,
      double karbohidrat,
      double protein,
      double lemak});
}

/// @nodoc
class __$$FoodCompositionImplCopyWithImpl<$Res>
    extends _$FoodCompositionCopyWithImpl<$Res, _$FoodCompositionImpl>
    implements _$$FoodCompositionImplCopyWith<$Res> {
  __$$FoodCompositionImplCopyWithImpl(
      _$FoodCompositionImpl _value, $Res Function(_$FoodCompositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodComposition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namaBahan = null,
    Object? energi = null,
    Object? karbohidrat = null,
    Object? protein = null,
    Object? lemak = null,
  }) {
    return _then(_$FoodCompositionImpl(
      namaBahan: null == namaBahan
          ? _value.namaBahan
          : namaBahan // ignore: cast_nullable_to_non_nullable
              as String,
      energi: null == energi
          ? _value.energi
          : energi // ignore: cast_nullable_to_non_nullable
              as double,
      karbohidrat: null == karbohidrat
          ? _value.karbohidrat
          : karbohidrat // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      lemak: null == lemak
          ? _value.lemak
          : lemak // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodCompositionImpl implements _FoodComposition {
  const _$FoodCompositionImpl(
      {@JsonKey(name: 'nama_bahan') required this.namaBahan,
      required this.energi,
      required this.karbohidrat,
      required this.protein,
      required this.lemak});

  factory _$FoodCompositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodCompositionImplFromJson(json);

  @override
  @JsonKey(name: 'nama_bahan')
  final String namaBahan;
  @override
  final double energi;
  @override
  final double karbohidrat;
  @override
  final double protein;
  @override
  final double lemak;

  @override
  String toString() {
    return 'FoodComposition(namaBahan: $namaBahan, energi: $energi, karbohidrat: $karbohidrat, protein: $protein, lemak: $lemak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodCompositionImpl &&
            (identical(other.namaBahan, namaBahan) ||
                other.namaBahan == namaBahan) &&
            (identical(other.energi, energi) || other.energi == energi) &&
            (identical(other.karbohidrat, karbohidrat) ||
                other.karbohidrat == karbohidrat) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.lemak, lemak) || other.lemak == lemak));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, namaBahan, energi, karbohidrat, protein, lemak);

  /// Create a copy of FoodComposition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodCompositionImplCopyWith<_$FoodCompositionImpl> get copyWith =>
      __$$FoodCompositionImplCopyWithImpl<_$FoodCompositionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodCompositionImplToJson(
      this,
    );
  }
}

abstract class _FoodComposition implements FoodComposition {
  const factory _FoodComposition(
      {@JsonKey(name: 'nama_bahan') required final String namaBahan,
      required final double energi,
      required final double karbohidrat,
      required final double protein,
      required final double lemak}) = _$FoodCompositionImpl;

  factory _FoodComposition.fromJson(Map<String, dynamic> json) =
      _$FoodCompositionImpl.fromJson;

  @override
  @JsonKey(name: 'nama_bahan')
  String get namaBahan;
  @override
  double get energi;
  @override
  double get karbohidrat;
  @override
  double get protein;
  @override
  double get lemak;

  /// Create a copy of FoodComposition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodCompositionImplCopyWith<_$FoodCompositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
