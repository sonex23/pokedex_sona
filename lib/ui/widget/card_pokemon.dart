import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_sona/features/detail/presentation/screen/pokemon_detail_screen.dart';
import 'package:pokedex_sona/features/home/presentation/view_param/list_pokemon_view_param.dart';
import 'package:pokedex_sona/misc/constant/router_constant.dart';
import 'package:pokedex_sona/misc/helper/helper.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

class CardPokemon extends StatelessWidget {
  final ListPokemonViewParam pokemonViewParam;
  final int indexList;
  const CardPokemon({
    super.key,
    required this.pokemonViewParam,
    required this.indexList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouterConstant.detailRouteName,
        extra: PokemonDetailScreenParam(
          listPokemonViewParam: pokemonViewParam,
          indexList: indexList,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Palette.greyBackground,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 4,
                        right: 8,
                      ),
                      child: Text(
                        pokemonViewParam.id.toId(),
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Palette.greyMedium,
                        ),
                      ),
                    ),
                  ),
                  Image.network(
                    pokemonViewParam.image,
                    width: constraints.maxHeight * 0.70,
                  ),
                  Text(
                    pokemonViewParam.name,
                    style: const TextStyle(
                      color: Palette.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
