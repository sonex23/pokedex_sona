// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_pokemon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListPokemonEntity _$ListPokemonEntityFromJson(Map<String, dynamic> json) {
  return _ListPokemonEntity.fromJson(json);
}

/// @nodoc
mixin _$ListPokemonEntity {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ListPokemonDataEntity>? get results =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListPokemonEntityCopyWith<ListPokemonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListPokemonEntityCopyWith<$Res> {
  factory $ListPokemonEntityCopyWith(
          ListPokemonEntity value, $Res Function(ListPokemonEntity) then) =
      _$ListPokemonEntityCopyWithImpl<$Res, ListPokemonEntity>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<ListPokemonDataEntity>? results});
}

/// @nodoc
class _$ListPokemonEntityCopyWithImpl<$Res, $Val extends ListPokemonEntity>
    implements $ListPokemonEntityCopyWith<$Res> {
  _$ListPokemonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ListPokemonDataEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListPokemonEntityImplCopyWith<$Res>
    implements $ListPokemonEntityCopyWith<$Res> {
  factory _$$ListPokemonEntityImplCopyWith(_$ListPokemonEntityImpl value,
          $Res Function(_$ListPokemonEntityImpl) then) =
      __$$ListPokemonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<ListPokemonDataEntity>? results});
}

/// @nodoc
class __$$ListPokemonEntityImplCopyWithImpl<$Res>
    extends _$ListPokemonEntityCopyWithImpl<$Res, _$ListPokemonEntityImpl>
    implements _$$ListPokemonEntityImplCopyWith<$Res> {
  __$$ListPokemonEntityImplCopyWithImpl(_$ListPokemonEntityImpl _value,
      $Res Function(_$ListPokemonEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$ListPokemonEntityImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ListPokemonDataEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListPokemonEntityImpl implements _ListPokemonEntity {
  const _$ListPokemonEntityImpl(
      {this.count,
      this.next,
      this.previous,
      final List<ListPokemonDataEntity>? results})
      : _results = results;

  factory _$ListPokemonEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListPokemonEntityImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<ListPokemonDataEntity>? _results;
  @override
  List<ListPokemonDataEntity>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListPokemonEntity(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListPokemonEntityImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListPokemonEntityImplCopyWith<_$ListPokemonEntityImpl> get copyWith =>
      __$$ListPokemonEntityImplCopyWithImpl<_$ListPokemonEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListPokemonEntityImplToJson(
      this,
    );
  }
}

abstract class _ListPokemonEntity implements ListPokemonEntity {
  const factory _ListPokemonEntity(
      {final int? count,
      final String? next,
      final String? previous,
      final List<ListPokemonDataEntity>? results}) = _$ListPokemonEntityImpl;

  factory _ListPokemonEntity.fromJson(Map<String, dynamic> json) =
      _$ListPokemonEntityImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ListPokemonDataEntity>? get results;
  @override
  @JsonKey(ignore: true)
  _$$ListPokemonEntityImplCopyWith<_$ListPokemonEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListPokemonDataEntity _$ListPokemonDataEntityFromJson(
    Map<String, dynamic> json) {
  return _ListPokemonDataEntity.fromJson(json);
}

/// @nodoc
mixin _$ListPokemonDataEntity {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListPokemonDataEntityCopyWith<ListPokemonDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListPokemonDataEntityCopyWith<$Res> {
  factory $ListPokemonDataEntityCopyWith(ListPokemonDataEntity value,
          $Res Function(ListPokemonDataEntity) then) =
      _$ListPokemonDataEntityCopyWithImpl<$Res, ListPokemonDataEntity>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$ListPokemonDataEntityCopyWithImpl<$Res,
        $Val extends ListPokemonDataEntity>
    implements $ListPokemonDataEntityCopyWith<$Res> {
  _$ListPokemonDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListPokemonDataEntityImplCopyWith<$Res>
    implements $ListPokemonDataEntityCopyWith<$Res> {
  factory _$$ListPokemonDataEntityImplCopyWith(
          _$ListPokemonDataEntityImpl value,
          $Res Function(_$ListPokemonDataEntityImpl) then) =
      __$$ListPokemonDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$ListPokemonDataEntityImplCopyWithImpl<$Res>
    extends _$ListPokemonDataEntityCopyWithImpl<$Res,
        _$ListPokemonDataEntityImpl>
    implements _$$ListPokemonDataEntityImplCopyWith<$Res> {
  __$$ListPokemonDataEntityImplCopyWithImpl(_$ListPokemonDataEntityImpl _value,
      $Res Function(_$ListPokemonDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ListPokemonDataEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListPokemonDataEntityImpl implements _ListPokemonDataEntity {
  const _$ListPokemonDataEntityImpl({this.name, this.url});

  factory _$ListPokemonDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListPokemonDataEntityImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'ListPokemonDataEntity(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListPokemonDataEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListPokemonDataEntityImplCopyWith<_$ListPokemonDataEntityImpl>
      get copyWith => __$$ListPokemonDataEntityImplCopyWithImpl<
          _$ListPokemonDataEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListPokemonDataEntityImplToJson(
      this,
    );
  }
}

abstract class _ListPokemonDataEntity implements ListPokemonDataEntity {
  const factory _ListPokemonDataEntity(
      {final String? name, final String? url}) = _$ListPokemonDataEntityImpl;

  factory _ListPokemonDataEntity.fromJson(Map<String, dynamic> json) =
      _$ListPokemonDataEntityImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ListPokemonDataEntityImplCopyWith<_$ListPokemonDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
