import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_sona/core/network/network_client.dart';
import 'package:pokedex_sona/core/shared/url.dart';
import 'package:pokedex_sona/features/home/data/api/list_pokemon_client.dart';
import 'package:pokedex_sona/features/home/data/repository/list_pokemon_repository_impl.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator
    ..registerFactory<Url>(() => Url())
    ..registerFactory<Dio>(() => NetworkClient(Dio(), url: serviceLocator<Url>()).dio)

    //list pokemon
    ..registerLazySingleton(() => ListPokemonClient(serviceLocator<Dio>()))
    ..registerLazySingleton(() => ListPokemonRepositoryImpl(listPokemonClient: serviceLocator<ListPokemonClient>()));
}
