import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_sona/features/detail/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex_sona/features/detail/presentation/screen/pokemon_detail_screen.dart';
import 'package:pokedex_sona/features/home/presentation/screen/home_screen.dart';
import 'package:pokedex_sona/misc/constant/router_constant.dart';

class MainRouter {
  GoRouter generateRoute() {
    return GoRouter(
      initialLocation: '/${RouterConstant.homeRouteName}',
      routes: [
        GoRoute(
          path: '/${RouterConstant.homeRouteName}',
          name: RouterConstant.homeRouteName,
          pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/${RouterConstant.detailRouteName}',
          name: RouterConstant.detailRouteName,
          pageBuilder: (context, state) => MaterialPage(
              child: BlocProvider<PokemonDetailCubit>(
            create: (context) => PokemonDetailCubit(),
            child: PokemonDetailScreen(
              param: state.extra as PokemonDetailScreenParam,
            ),
          )),
        ),
      ],
    );
  }
}
