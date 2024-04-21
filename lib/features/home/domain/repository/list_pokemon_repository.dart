import 'package:pokedex_sona/core/network/result.dart';
import 'package:pokedex_sona/features/home/presentation/view_param/list_pokemon_view_param.dart';

abstract class ListPokemonRepository {
  Future<Result<List<ListPokemonViewParam>>> getListPokemon({
    required int offset,
    required int limit,
  });
}
