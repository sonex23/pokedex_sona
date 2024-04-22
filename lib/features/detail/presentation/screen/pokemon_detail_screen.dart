import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_sona/features/detail/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex_sona/features/home/presentation/cubit/list_pokemon_cubit.dart';
import 'package:pokedex_sona/features/home/presentation/view_param/list_pokemon_view_param.dart';
import 'package:pokedex_sona/misc/helper/helper.dart';
import 'package:pokedex_sona/ui/images/images.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

class PokemonDetailScreenParam {
  final ListPokemonViewParam listPokemonViewParam;
  final int indexList;
  const PokemonDetailScreenParam({
    required this.listPokemonViewParam,
    required this.indexList,
  });
}

class PokemonDetailScreen extends StatefulWidget {
  final PokemonDetailScreenParam param;
  const PokemonDetailScreen({
    super.key,
    required this.param,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late int indexList;

  @override
  void initState() {
    super.initState();
    context.read<PokemonDetailCubit>().getPokemonDetail(id: widget.param.listPokemonViewParam.id);
    indexList = widget.param.indexList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: state.pokemonDetail?.types[0].color ?? Palette.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Palette.white,
            forceMaterialTransparency: true,
            title: Text(
              state.pokemonDetail?.name ?? "",
              style: const TextStyle(
                color: Palette.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              Text(
                state.pokemonDetail?.id.toId() ?? '#000',
                style: const TextStyle(
                  color: Palette.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            Images.pokeballTransparent,
                            color: Palette.white,
                            width: constraints.maxWidth * 0.6,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    state.pokemonDetail?.types.map((type) => _buildTypeWidget(name: type.name, color: type.color)).toList() ?? [],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "About",
                                style: TextStyle(
                                  color: state.pokemonDetail?.types[0].color ?? Palette.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildAboutWidget(
                                      body: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            Images.weight,
                                            width: 16,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "${state.pokemonDetail?.weight ?? 0} kg",
                                            style: const TextStyle(color: Palette.black, fontSize: 10, fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      title: "Weight",
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Palette.greyLight,
                                            ),
                                            left: BorderSide(
                                              color: Palette.greyLight,
                                            ),
                                          ),
                                        ),
                                        child: _buildAboutWidget(
                                          body: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                Images.height,
                                                width: 16,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "${state.pokemonDetail?.height ?? 0} m",
                                                style: const TextStyle(color: Palette.black, fontSize: 10, fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          title: "Height",
                                        )),
                                  ),
                                  Expanded(
                                      child: _buildAboutWidget(
                                    body: Column(
                                        children: List.generate(
                                      2,
                                      (index) => Text(
                                        state.pokemonDetail?.moves[index] ?? '',
                                        style: const TextStyle(
                                          color: Palette.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )),
                                    title: "Moves",
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                state.pokemonDetail?.desc ?? '',
                                style: const TextStyle(
                                  color: Palette.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Base Stats",
                                style: TextStyle(
                                  color: state.pokemonDetail?.types[0].color ?? Palette.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 12),
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Palette.greyLight),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: List.generate(state.pokemonDetail?.stats.length ?? 0, (index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 3,
                                          ),
                                          child: Text(
                                            state.pokemonDetail?.stats[index].name.toShortStat() ?? '',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: state.pokemonDetail?.types[0].color ?? Palette.black,
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: List.generate(state.pokemonDetail?.stats.length ?? 0, (index) {
                                        return Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 3),
                                              child: Text(
                                                state.pokemonDetail?.stats[index].value.toThreeDigits() ?? "000",
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  color: Palette.black,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: LinearProgressIndicator(
                                                value: (state.pokemonDetail?.stats[index].value ?? 0).toDouble() / 255,
                                                color: state.pokemonDetail?.types[0].color ?? Palette.red,
                                                backgroundColor: state.pokemonDetail?.types[0].color.withOpacity(0.2) ?? Palette.red.withOpacity(0.2),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 80,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: state.pokemonDetail?.id != context.read<ListPokemonCubit>().listPokemon[0].id,
                        child: GestureDetector(
                          onTap: () {
                            if (state.pokemonDetail?.id != null) {
                              setState(() {
                                indexList--;
                              });
                              context.read<PokemonDetailCubit>().getPokemonDetail(id: context.read<ListPokemonCubit>().listPokemon[indexList].id);
                            }
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Palette.white,
                          ),
                        ),
                      ),
                      LayoutBuilder(builder: (context, contstraints) {
                        if (state.isLoadingState) {
                          return const CircularProgressIndicator();
                        }
                        return Image.network(
                          state.pokemonDetail?.image ?? '',
                          width: MediaQuery.of(context).size.width * 0.6,
                        );
                      }),
                      Visibility(
                        visible: state.pokemonDetail?.id !=
                            context.read<ListPokemonCubit>().listPokemon[context.read<ListPokemonCubit>().listPokemon.length - 1].id,
                        child: GestureDetector(
                          onTap: () {
                            if (state.pokemonDetail?.id != null) {
                              setState(() {
                                indexList++;
                              });
                              context.read<PokemonDetailCubit>().getPokemonDetail(id: context.read<ListPokemonCubit>().listPokemon[indexList].id);
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Palette.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column _buildAboutWidget({
    required Widget body,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        body,
        const SizedBox(
          height: 12,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Palette.greyMedium,
            fontWeight: FontWeight.w400,
            fontSize: 8,
          ),
        )
      ],
    );
  }

  Container _buildTypeWidget({
    required String name,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Palette.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
