import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_sona/ui/images/images.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Palette.grassColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Palette.white,
        title: Text(
          "Bulbasaur",
          style: const TextStyle(
            color: Palette.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Text(
            "#001",
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Palette.grassColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Grass",
                                style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
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
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Palette.white,
                  ),
                  LayoutBuilder(builder: (context, contstraints) {
                    return Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                      width: MediaQuery.of(context).size.width * 0.6,
                    );
                  }),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Palette.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
