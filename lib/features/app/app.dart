import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_sona/features/app/routes.dart';
import 'package:pokedex_sona/features/app/theme.dart';
import 'package:pokedex_sona/features/home/presentation/cubit/list_pokemon_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListPokemonCubit>(
      create: (context) => ListPokemonCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.themeData,
        routerConfig: MainRouter().generateRoute(),
      ),
    );
  }
}
