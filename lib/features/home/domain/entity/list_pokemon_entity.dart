import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_pokemon_entity.freezed.dart';
part 'list_pokemon_entity.g.dart';

@freezed
class ListPokemonEntity with _$ListPokemonEntity {
  const factory ListPokemonEntity({
    int? count,
    String? next,
    String? previous,
    List<ListPokemonDataEntity>? results,
  }) = _ListPokemonEntity;

  factory ListPokemonEntity.fromJson(Map<String, dynamic> json) => _$ListPokemonEntityFromJson(json);
}

@freezed
class ListPokemonDataEntity with _$ListPokemonDataEntity {
  const factory ListPokemonDataEntity({
    String? name,
    String? url,
  }) = _ListPokemonDataEntity;

  factory ListPokemonDataEntity.fromJson(Map<String, dynamic> json) => _$ListPokemonDataEntityFromJson(json);
}
