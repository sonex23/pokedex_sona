import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_sona/features/home/domain/entity/list_pokemon_entity.dart';
import 'package:pokedex_sona/misc/helper/helper.dart';

part 'list_pokemon_view_param.freezed.dart';

@freezed
class ListPokemonViewParam with _$ListPokemonViewParam {
  const factory ListPokemonViewParam({
    required String name,
    required int id,
    required String image,
  }) = _ListPokemonViewParam;

  factory ListPokemonViewParam.fromEntity(ListPokemonDataEntity entity) => ListPokemonViewParam(
        name: entity.name ?? "",
        id: Helper.getIdFromUrl(entity.url ?? ''),
        image:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${Helper.getIdFromUrl(entity.url ?? '')}.png",
      );
}
