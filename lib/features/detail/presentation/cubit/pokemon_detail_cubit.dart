import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_sona/core/di/service_locator.dart';
import 'package:pokedex_sona/core/network/result.dart';
import 'package:pokedex_sona/features/detail/data/repository/list_pokemon_repository_impl.dart';
import 'package:pokedex_sona/features/detail/presentation/view_param/pokemon_detail_view_param.dart';

part 'pokemon_detail_cubit.freezed.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit() : super(const PokemonDetailState.initial());

  void getPokemonDetail({
    required int id,
  }) async {
    try {
      emit(const PokemonDetailState.loading());
      Result result = await serviceLocator<PokemonDetailRepositoryImpl>().getPokemonDetail(
        id: id,
      );
      if (result is ResponseSuccess) {
        emit(PokemonDetailState.loaded(result.data));
      } else if (result is ResponseError) {
        emit(PokemonDetailState.error(result.error ?? "Error"));
      }
    } catch (e) {
      emit(PokemonDetailState.error(e.toString()));
    }
  }
}

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState.initial() = _InitialState;
  const factory PokemonDetailState.loading() = _LoadingState;
  const factory PokemonDetailState.loaded(PokemonDetailViewParam pokemonDetail) = _LoadedState;
  const factory PokemonDetailState.error(String error) = _ErrorState;
}

extension PokemonDetailStateExtension on PokemonDetailState {
  bool get isLoadingState => this is _LoadingState;
  bool get isErrorState => this is _ErrorState;
  bool get isLoadedState => this is _LoadedState;
  String? get errorMessage => mapOrNull(error: (value) => value.error);
  PokemonDetailViewParam? get pokemonDetail => mapOrNull(loaded: (value) => value.pokemonDetail);
}
