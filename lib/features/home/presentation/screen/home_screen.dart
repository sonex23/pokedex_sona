import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:pokedex_sona/ui/images/images.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                              child: Padding(
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
                                      decoration: BoxDecoration(color: Palette.white, borderRadius: BorderRadius.circular(12)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          useSafeArea: true,
                          alignment: Alignment.topRight,
                          offset: const Offset(-16, 100));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Palette.white,
                      ),
                      child: Image.asset(Images.tag),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
