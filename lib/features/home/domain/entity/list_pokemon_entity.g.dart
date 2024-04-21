// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pokemon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListPokemonEntityImpl _$$ListPokemonEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ListPokemonEntityImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => ListPokemonDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListPokemonEntityImplToJson(
        _$ListPokemonEntityImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_$ListPokemonDataEntityImpl _$$ListPokemonDataEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ListPokemonDataEntityImpl(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ListPokemonDataEntityImplToJson(
        _$ListPokemonDataEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
