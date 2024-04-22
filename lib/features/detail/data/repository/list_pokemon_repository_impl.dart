import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:pokedex_sona/core/network/result.dart';
import 'package:pokedex_sona/features/detail/data/api/pokemon_detail_client.dart';
import 'package:pokedex_sona/features/detail/domain/entity/pokemon_detail_entity.dart';
import 'package:pokedex_sona/features/detail/domain/repository/pokemon_detail_repository.dart';
import 'package:pokedex_sona/features/detail/presentation/view_param/pokemon_detail_view_param.dart';

class PokemonDetailRepositoryImpl extends PokemonDetailRepository {
  final PokemonDetailClient pokemonDetailClient;
  PokemonDetailRepositoryImpl({required this.pokemonDetailClient});

  @override
  Future<Result<PokemonDetailViewParam>> getPokemonDetail({
    required int id,
  }) async {
    try {
      PokemonDetailEntity entity = await pokemonDetailClient.getPokemonDetail(
        id: id,
      );
      return Result.data(PokemonDetailViewParam.fromEntity(entity));
    } on DioException catch (e) {
      return Result.error(e.response?.data['message'] ?? "Error");
    }
  }
}
