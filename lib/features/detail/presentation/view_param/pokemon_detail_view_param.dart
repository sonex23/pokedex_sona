import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_sona/features/detail/domain/entity/pokemon_detail_entity.dart';
import 'package:pokedex_sona/misc/helper/helper.dart';

part 'pokemon_detail_view_param.freezed.dart';

@freezed
class PokemonDetailViewParam with _$PokemonDetailViewParam {
  const factory PokemonDetailViewParam({
    required String name,
    required int id,
    required String image,
    required List<TypeViewParam> types,
    required double weight,
    required double height,
    required List<String> moves,
    required String desc,
    required List<StatViewParam> stats,
  }) = _PokemonDetailViewParam;

  factory PokemonDetailViewParam.fromEntity(PokemonDetailEntity entity) => PokemonDetailViewParam(
        name: entity.name ?? '',
        id: entity.id ?? 0,
        image: entity.sprites?.other?.officialArtwork?.frontDefault ?? '',
        types: entity.types?.map((type) => TypeViewParam.fromEntity(type.type ?? const Species())).toList() ?? [],
        weight: entity.weight ?? 0,
        height: entity.height ?? 0,
        moves: entity.moves?.map((move) => move.move?.name ?? '').toList() ?? [],
        desc: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
        stats: entity.stats?.map((stat) => StatViewParam.fromEntity(stat)).toList() ?? [],
      );
}

@freezed
class TypeViewParam with _$TypeViewParam {
  const factory TypeViewParam({
    required String name,
    required Color color,
  }) = _TypeViewParam;

  factory TypeViewParam.fromEntity(Species entity) => TypeViewParam(
        name: entity.name?.capitalizeFirstLetter() ?? '',
        color: Helper.getColorType(entity.name?.capitalizeFirstLetter() ?? ''),
      );
}

@freezed
class StatViewParam with _$StatViewParam {
  const factory StatViewParam({
    required String name,
    required int value,
  }) = _StatViewParam;

  factory StatViewParam.fromEntity(Stat entity) => StatViewParam(
        name: entity.stat?.name ?? "",
        value: entity.baseStat ?? 0,
      );
}
