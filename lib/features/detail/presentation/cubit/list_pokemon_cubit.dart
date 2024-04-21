import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_sona/core/di/service_locator.dart';
import 'package:pokedex_sona/core/network/result.dart';
import 'package:pokedex_sona/features/home/data/repository/list_pokemon_repository_impl.dart';
import 'package:pokedex_sona/features/home/presentation/view_param/list_pokemon_view_param.dart';
import 'package:pokedex_sona/misc/enum/enum.dart';

part 'list_pokemon_cubit.freezed.dart';

class ListPokemonCubit extends Cubit<ListPokemonState> {
  ListPokemonCubit() : super(const ListPokemonState.initial());

  List<ListPokemonViewParam> listPokemon = [];

  void sortListPokemon(SortBy sortBy) {
    if (sortBy == SortBy.name) {
      listPokemon.sort((a, b) => a.name.compareTo(b.name));
      emit(ListPokemonState.loaded(listPokemon));
    } else {
      listPokemon.sort((a, b) => a.id - b.id);
      emit(ListPokemonState.loaded(listPokemon));
    }
  }

  void getListPokemon({
    required int offset,
    required int limit,
  }) async {
    try {
      emit(const ListPokemonState.loading());
      Result result = await serviceLocator<ListPokemonRepositoryImpl>().getListPokemon(
        offset: offset,
        limit: limit,
      );
      if (result is ResponseSuccess) {
        listPokemon.addAll(result.data);
        emit(ListPokemonState.loaded(result.data));
      } else if (result is ResponseError) {
        emit(ListPokemonState.error(result.error ?? "Error"));
      }
    } catch (e) {
      emit(ListPokemonState.error(e.toString()));
    }
  }
}

@freezed
class ListPokemonState with _$ListPokemonState {
  const factory ListPokemonState.initial() = _InitialState;
  const factory ListPokemonState.loading() = _LoadingState;
  const factory ListPokemonState.loaded(List<ListPokemonViewParam> listPokemon) = _LoadedState;
  const factory ListPokemonState.error(String error) = _ErrorState;
}

extension ListPokemonStateExtension on ListPokemonState {
  bool get isLoadingState => this is _LoadingState;
  bool get isErrorState => this is _ErrorState;
  bool get isLoadedState => this is _LoadedState;
  String? get errorMessage => mapOrNull(error: (value) => value.error);
  List<ListPokemonViewParam>? get listPokemon => mapOrNull(loaded: (value) => value.listPokemon);
}
