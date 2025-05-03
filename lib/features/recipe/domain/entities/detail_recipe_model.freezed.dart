// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailRecipeModel _$DetailRecipeModelFromJson(Map<String, dynamic> json) {
  return _DetailRecipeModel.fromJson(json);
}

/// @nodoc
mixin _$DetailRecipeModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "composition_id")
  int? get compositionId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "sumber")
  String? get sumber => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "energi")
  int? get energi => throw _privateConstructorUsedError;
  @JsonKey(name: "protein")
  double? get protein => throw _privateConstructorUsedError;
  @JsonKey(name: "lemak")
  double? get lemak => throw _privateConstructorUsedError;
  @JsonKey(name: "karbohidrat")
  int? get karbohidrat => throw _privateConstructorUsedError;
  @JsonKey(name: "ingredients")
  List<IngredientModel>? get ingredients => throw _privateConstructorUsedError;
  @JsonKey(name: "steps")
  List<String>? get steps => throw _privateConstructorUsedError;

  /// Serializes this DetailRecipeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailRecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailRecipeModelCopyWith<DetailRecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailRecipeModelCopyWith<$Res> {
  factory $DetailRecipeModelCopyWith(
          DetailRecipeModel value, $Res Function(DetailRecipeModel) then) =
      _$DetailRecipeModelCopyWithImpl<$Res, DetailRecipeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "composition_id") int? compositionId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "sumber") String? sumber,
      @JsonKey(name: "image_url") String? imageUrl,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "energi") int? energi,
      @JsonKey(name: "protein") double? protein,
      @JsonKey(name: "lemak") double? lemak,
      @JsonKey(name: "karbohidrat") int? karbohidrat,
      @JsonKey(name: "ingredients") List<IngredientModel>? ingredients,
      @JsonKey(name: "steps") List<String>? steps});
}

/// @nodoc
class _$DetailRecipeModelCopyWithImpl<$Res, $Val extends DetailRecipeModel>
    implements $DetailRecipeModelCopyWith<$Res> {
  _$DetailRecipeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailRecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? compositionId = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? sumber = freezed,
    Object? imageUrl = freezed,
    Object? date = freezed,
    Object? energi = freezed,
    Object? protein = freezed,
    Object? lemak = freezed,
    Object? karbohidrat = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      compositionId: freezed == compositionId
          ? _value.compositionId
          : compositionId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      sumber: freezed == sumber
          ? _value.sumber
          : sumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      energi: freezed == energi
          ? _value.energi
          : energi // ignore: cast_nullable_to_non_nullable
              as int?,
      protein: freezed == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double?,
      lemak: freezed == lemak
          ? _value.lemak
          : lemak // ignore: cast_nullable_to_non_nullable
              as double?,
      karbohidrat: freezed == karbohidrat
          ? _value.karbohidrat
          : karbohidrat // ignore: cast_nullable_to_non_nullable
              as int?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailRecipeModelImplCopyWith<$Res>
    implements $DetailRecipeModelCopyWith<$Res> {
  factory _$$DetailRecipeModelImplCopyWith(_$DetailRecipeModelImpl value,
          $Res Function(_$DetailRecipeModelImpl) then) =
      __$$DetailRecipeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "composition_id") int? compositionId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "sumber") String? sumber,
      @JsonKey(name: "image_url") String? imageUrl,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "energi") int? energi,
      @JsonKey(name: "protein") double? protein,
      @JsonKey(name: "lemak") double? lemak,
      @JsonKey(name: "karbohidrat") int? karbohidrat,
      @JsonKey(name: "ingredients") List<IngredientModel>? ingredients,
      @JsonKey(name: "steps") List<String>? steps});
}

/// @nodoc
class __$$DetailRecipeModelImplCopyWithImpl<$Res>
    extends _$DetailRecipeModelCopyWithImpl<$Res, _$DetailRecipeModelImpl>
    implements _$$DetailRecipeModelImplCopyWith<$Res> {
  __$$DetailRecipeModelImplCopyWithImpl(_$DetailRecipeModelImpl _value,
      $Res Function(_$DetailRecipeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailRecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? compositionId = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? sumber = freezed,
    Object? imageUrl = freezed,
    Object? date = freezed,
    Object? energi = freezed,
    Object? protein = freezed,
    Object? lemak = freezed,
    Object? karbohidrat = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
  }) {
    return _then(_$DetailRecipeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      compositionId: freezed == compositionId
          ? _value.compositionId
          : compositionId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      sumber: freezed == sumber
          ? _value.sumber
          : sumber // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      energi: freezed == energi
          ? _value.energi
          : energi // ignore: cast_nullable_to_non_nullable
              as int?,
      protein: freezed == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double?,
      lemak: freezed == lemak
          ? _value.lemak
          : lemak // ignore: cast_nullable_to_non_nullable
              as double?,
      karbohidrat: freezed == karbohidrat
          ? _value.karbohidrat
          : karbohidrat // ignore: cast_nullable_to_non_nullable
              as int?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailRecipeModelImpl implements _DetailRecipeModel {
  const _$DetailRecipeModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "composition_id") this.compositionId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "sumber") this.sumber,
      @JsonKey(name: "image_url") this.imageUrl,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "energi") this.energi,
      @JsonKey(name: "protein") this.protein,
      @JsonKey(name: "lemak") this.lemak,
      @JsonKey(name: "karbohidrat") this.karbohidrat,
      @JsonKey(name: "ingredients") final List<IngredientModel>? ingredients,
      @JsonKey(name: "steps") final List<String>? steps})
      : _ingredients = ingredients,
        _steps = steps;

  factory _$DetailRecipeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailRecipeModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "composition_id")
  final int? compositionId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "sumber")
  final String? sumber;
  @override
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @override
  @JsonKey(name: "date")
  final String? date;
  @override
  @JsonKey(name: "energi")
  final int? energi;
  @override
  @JsonKey(name: "protein")
  final double? protein;
  @override
  @JsonKey(name: "lemak")
  final double? lemak;
  @override
  @JsonKey(name: "karbohidrat")
  final int? karbohidrat;
  final List<IngredientModel>? _ingredients;
  @override
  @JsonKey(name: "ingredients")
  List<IngredientModel>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _steps;
  @override
  @JsonKey(name: "steps")
  List<String>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DetailRecipeModel(id: $id, compositionId: $compositionId, name: $name, title: $title, sumber: $sumber, imageUrl: $imageUrl, date: $date, energi: $energi, protein: $protein, lemak: $lemak, karbohidrat: $karbohidrat, ingredients: $ingredients, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailRecipeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.compositionId, compositionId) ||
                other.compositionId == compositionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.sumber, sumber) || other.sumber == sumber) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.energi, energi) || other.energi == energi) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.lemak, lemak) || other.lemak == lemak) &&
            (identical(other.karbohidrat, karbohidrat) ||
                other.karbohidrat == karbohidrat) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      compositionId,
      name,
      title,
      sumber,
      imageUrl,
      date,
      energi,
      protein,
      lemak,
      karbohidrat,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_steps));

  /// Create a copy of DetailRecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailRecipeModelImplCopyWith<_$DetailRecipeModelImpl> get copyWith =>
      __$$DetailRecipeModelImplCopyWithImpl<_$DetailRecipeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailRecipeModelImplToJson(
      this,
    );
  }
}

abstract class _DetailRecipeModel implements DetailRecipeModel {
  const factory _DetailRecipeModel(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "composition_id") final int? compositionId,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "sumber") final String? sumber,
      @JsonKey(name: "image_url") final String? imageUrl,
      @JsonKey(name: "date") final String? date,
      @JsonKey(name: "energi") final int? energi,
      @JsonKey(name: "protein") final double? protein,
      @JsonKey(name: "lemak") final double? lemak,
      @JsonKey(name: "karbohidrat") final int? karbohidrat,
      @JsonKey(name: "ingredients") final List<IngredientModel>? ingredients,
      @JsonKey(name: "steps")
      final List<String>? steps}) = _$DetailRecipeModelImpl;

  factory _DetailRecipeModel.fromJson(Map<String, dynamic> json) =
      _$DetailRecipeModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "composition_id")
  int? get compositionId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "sumber")
  String? get sumber;
  @override
  @JsonKey(name: "image_url")
  String? get imageUrl;
  @override
  @JsonKey(name: "date")
  String? get date;
  @override
  @JsonKey(name: "energi")
  int? get energi;
  @override
  @JsonKey(name: "protein")
  double? get protein;
  @override
  @JsonKey(name: "lemak")
  double? get lemak;
  @override
  @JsonKey(name: "karbohidrat")
  int? get karbohidrat;
  @override
  @JsonKey(name: "ingredients")
  List<IngredientModel>? get ingredients;
  @override
  @JsonKey(name: "steps")
  List<String>? get steps;

  /// Create a copy of DetailRecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailRecipeModelImplCopyWith<_$DetailRecipeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) {
  return _IngredientModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "nama_bahan")
  String? get namaBahan => throw _privateConstructorUsedError;

  /// Serializes this IngredientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientModelCopyWith<IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModelCopyWith<$Res> {
  factory $IngredientModelCopyWith(
          IngredientModel value, $Res Function(IngredientModel) then) =
      _$IngredientModelCopyWithImpl<$Res, IngredientModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "nama_bahan") String? namaBahan});
}

/// @nodoc
class _$IngredientModelCopyWithImpl<$Res, $Val extends IngredientModel>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namaBahan = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namaBahan: freezed == namaBahan
          ? _value.namaBahan
          : namaBahan // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientModelImplCopyWith<$Res>
    implements $IngredientModelCopyWith<$Res> {
  factory _$$IngredientModelImplCopyWith(_$IngredientModelImpl value,
          $Res Function(_$IngredientModelImpl) then) =
      __$$IngredientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "nama_bahan") String? namaBahan});
}

/// @nodoc
class __$$IngredientModelImplCopyWithImpl<$Res>
    extends _$IngredientModelCopyWithImpl<$Res, _$IngredientModelImpl>
    implements _$$IngredientModelImplCopyWith<$Res> {
  __$$IngredientModelImplCopyWithImpl(
      _$IngredientModelImpl _value, $Res Function(_$IngredientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? namaBahan = freezed,
  }) {
    return _then(_$IngredientModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      namaBahan: freezed == namaBahan
          ? _value.namaBahan
          : namaBahan // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientModelImpl implements _IngredientModel {
  const _$IngredientModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "nama_bahan") this.namaBahan});

  factory _$IngredientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "nama_bahan")
  final String? namaBahan;

  @override
  String toString() {
    return 'IngredientModel(id: $id, namaBahan: $namaBahan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaBahan, namaBahan) ||
                other.namaBahan == namaBahan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaBahan);

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientModelImplCopyWith<_$IngredientModelImpl> get copyWith =>
      __$$IngredientModelImplCopyWithImpl<_$IngredientModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientModelImplToJson(
      this,
    );
  }
}

abstract class _IngredientModel implements IngredientModel {
  const factory _IngredientModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "nama_bahan") final String? namaBahan}) =
      _$IngredientModelImpl;

  factory _IngredientModel.fromJson(Map<String, dynamic> json) =
      _$IngredientModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "nama_bahan")
  String? get namaBahan;

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientModelImplCopyWith<_$IngredientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
