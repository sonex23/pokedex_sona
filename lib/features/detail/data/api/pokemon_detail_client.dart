import 'package:dio/dio.dart';
import 'package:pokedex_sona/features/detail/domain/entity/pokemon_detail_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_detail_client.g.dart';

@RestApi()
abstract class PokemonDetailClient {
  factory PokemonDetailClient(Dio dio) = _PokemonDetailClient;

  @GET('/pokemon/{id}')
  Future<PokemonDetailEntity> getPokemonDetail({
    @Path('id') required int id,
  });
}
