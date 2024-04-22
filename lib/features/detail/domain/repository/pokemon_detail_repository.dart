import 'package:pokedex_sona/core/network/result.dart';
import 'package:pokedex_sona/features/detail/presentation/view_param/pokemon_detail_view_param.dart';

abstract class PokemonDetailRepository {
  Future<Result<PokemonDetailViewParam>> getPokemonDetail({
    required int id,
  });
}
