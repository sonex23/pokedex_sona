import 'package:dio/dio.dart';
import 'package:pokedex_sona/features/home/domain/entity/list_pokemon_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'list_pokemon_client.g.dart';

@RestApi()
abstract class ListPokemonClient {
  factory ListPokemonClient(Dio dio) = _ListPokemonClient;

  @GET('/pokemon')
  Future<ListPokemonEntity> getListPokemon({
    @Query('offset') required int offset,
    @Query('limit') required int limit,
  });
}
