import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:pokedex_sona/misc/enum/enum.dart';
import 'package:pokedex_sona/ui/images/images.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SortBy? sortBy = SortBy.number;
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
            Padding(
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
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                    onTap: () {
                      showPopupCard(
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
                                                  },
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setNewState(() {
                                                      sortBy = SortBy.number;
                                                    });
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
                                                  },
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setNewState(() {
                                                      sortBy = SortBy.name;
                                                    });
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
                        Images.tag,
                        width: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
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
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          clipBehavior: Clip.none,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.95,
                          ),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
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
                                          color: Palette.grey_background,
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
                                              "#001",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Palette.grey_medium,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Image.network(
                                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                                          width: constraints.maxHeight * 0.70,
                                        ),
                                        Text(
                                          "Bulbasaur",
                                          style: TextStyle(
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
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
