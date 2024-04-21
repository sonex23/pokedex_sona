import 'package:dio/dio.dart';
import 'package:pokedex_sona/core/network/result.dart';
import 'package:pokedex_sona/features/home/data/api/list_pokemon_client.dart';
import 'package:pokedex_sona/features/home/domain/entity/list_pokemon_entity.dart';
import 'package:pokedex_sona/features/home/domain/repository/list_pokemon_repository.dart';
import 'package:pokedex_sona/features/home/presentation/view_param/list_pokemon_view_param.dart';

class ListPokemonRepositoryImpl extends ListPokemonRepository {
  final ListPokemonClient listPokemonClient;
  ListPokemonRepositoryImpl({required this.listPokemonClient});

  @override
  Future<Result<List<ListPokemonViewParam>>> getListPokemon({
    required int offset,
    required int limit,
  }) async {
    List<ListPokemonViewParam> listPokemon = [];
    try {
      ListPokemonEntity entity = await listPokemonClient.getListPokemon(
        offset: offset,
        limit: limit,
      );
      if (entity.results != null) {
        for (ListPokemonDataEntity entity in entity.results ?? []) {
          listPokemon.add(ListPokemonViewParam.fromEntity(entity));
        }
      }
      return Result.data(listPokemon);
    } on DioException catch (e) {
      return Result.error(e.response?.data['message'] ?? "Error");
    }
  }
}
