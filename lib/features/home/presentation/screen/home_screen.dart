import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/web.dart';
import 'package:pokedex_sona/features/home/presentation/cubit/list_pokemon_cubit.dart';
import 'package:pokedex_sona/features/home/presentation/view_param/list_pokemon_view_param.dart';
import 'package:pokedex_sona/misc/enum/enum.dart';
import 'package:pokedex_sona/ui/images/images.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';
import 'package:pokedex_sona/ui/widget/card_pokemon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SortBy? sortBy = SortBy.number;
  int offset = 0;
  int limit = 8;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  bool hasNextPage = true;
  bool isLoadNextPage = false;
  bool isFirstLoad = true;
  List<ListPokemonViewParam> _listPokemonSearch = [];
  bool isSearch = false;

  void _getListPokemon({
    required offset,
  }) {
    context.read<ListPokemonCubit>().getListPokemon(
          offset: offset,
          limit: limit,
        );
  }

  void _searchPokemon(String name) {
    if (name.isEmpty) {
      setState(() {
        isSearch = false;
      });
      return;
    }

    setState(() {
      isSearch = true;
      _listPokemonSearch = context.read<ListPokemonCubit>().listPokemon.where((pokemon) => pokemon.name.contains(name)).toList();

      Logger().d(_listPokemonSearch);
    });
  }

  @override
  void initState() {
    super.initState();
    _getListPokemon(offset: offset);

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          offset += 8;
          if (hasNextPage) {
            isLoadNextPage = true;
            _getListPokemon(offset: offset);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.red,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            _buildHeader(),
            const SizedBox(
              height: 14,
            ),
            _buildSearchBar(context),
            const SizedBox(
              height: 20,
            ),
            _buildListPokemon(),
          ],
        ),
      ),
    );
  }

  Expanded _buildListPokemon() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: BlocConsumer<ListPokemonCubit, ListPokemonState>(
          listener: (context, state) {
            if (state.isLoadedState && offset == 0) {
              setState(() {
                offset += 8;
                _getListPokemon(offset: offset);
              });
            }
            if (state.isLoadedState) {
              setState(() {
                isLoadNextPage = false;
                isFirstLoad = false;
              });
            }
            if (state.isLoadedState && state.listPokemon!.isEmpty) {
              setState(() {
                hasNextPage = false;
              });
            }
            if (state.isErrorState) {
              Fluttertoast.showToast(
                msg: state.errorMessage ?? "Error",
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
              );
            }
          },
          builder: (context, state) {
            var listPokemonCubit = context.read<ListPokemonCubit>();
            if (isFirstLoad) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Palette.red,
                ),
              );
            } else if (isSearch) {
              return GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  // controller: scrollController,
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: _listPokemonSearch.length,
                  itemBuilder: (context, index) {
                    return CardPokemon(
                      pokemonViewParam: _listPokemonSearch[index],
                      indexList: index,
                    );
                  });
            } else {
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: scrollController,
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.95,
                        ),
                        itemCount: listPokemonCubit.listPokemon.length,
                        itemBuilder: (context, index) {
                          return CardPokemon(
                            pokemonViewParam: listPokemonCubit.listPokemon[index],
                            indexList: index,
                          );
                        }),
                  ),
                  Visibility(
                    visible: isLoadNextPage,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Palette.red,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Padding _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                _searchPokemon(value);
              },
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Palette.black,
              ),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                    left: 14,
                    right: 8,
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    opticalSize: 12,
                    color: Palette.red,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  maxHeight: 32,
                ),
                hintText: "Search",
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Palette.greyMedium,
                ),
                contentPadding: const EdgeInsets.all(8),
                isDense: true,
                filled: true,
                fillColor: Palette.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                  gapPadding: 0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              var isSortedBy = await showPopupCard(
                  context: context,
                  builder: (context) {
                    return PopupCard(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Palette.red,
                      child: StatefulBuilder(builder: (context, setNewState) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  "Sort by:",
                                  style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Radio<SortBy>(
                                          value: SortBy.number,
                                          groupValue: sortBy,
                                          onChanged: (value) {
                                            setNewState(() {
                                              sortBy = value;
                                            });
                                            Navigator.pop(context, sortBy);
                                          },
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setNewState(() {
                                              sortBy = SortBy.number;
                                            });
                                            Navigator.pop(context, sortBy);
                                          },
                                          child: const Text(
                                            'Number',
                                            style: TextStyle(
                                              color: Palette.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Radio<SortBy>(
                                          value: SortBy.name,
                                          groupValue: sortBy,
                                          onChanged: (value) {
                                            setNewState(() {
                                              sortBy = value;
                                            });
                                            Navigator.pop(context, sortBy);
                                          },
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setNewState(() {
                                              sortBy = SortBy.name;
                                            });
                                            Navigator.pop(context, sortBy);
                                          },
                                          child: const Text(
                                            'Name',
                                            style: TextStyle(
                                              color: Palette.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                  useSafeArea: true,
                  alignment: Alignment.topRight,
                  offset: const Offset(-16, 100));
              if (isSortedBy != null) {
                // ignore: use_build_context_synchronously
                context.read<ListPokemonCubit>().sortListPokemon(sortBy!);
                setState(() {});
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              alignment: Alignment.center,
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    spreadRadius: -12,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Image.asset(
                sortBy == SortBy.number ? Images.tag : Images.byName,
                width: 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Image.asset(Images.pokeball),
          const SizedBox(
            width: 16,
          ),
          const Text(
            'Pokédex',
            style: TextStyle(
              color: Palette.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
