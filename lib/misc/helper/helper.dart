import 'package:flutter/material.dart';
import 'package:pokedex_sona/ui/palette/palette.dart';

extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension IntExtention on int {
  String toId() {
    int temp = this;
    String tempString = temp.toString();
    switch (tempString.length) {
      case 1:
        return "#00$temp";
      case 2:
        return "#0$temp";
      case 3:
        return "#$temp";
      default:
        return "#000";
    }
  }

  String toThreeDigits() {
    int temp = this;
    String tempString = temp.toString();
    switch (tempString.length) {
      case 1:
        return "00$temp";
      case 2:
        return "0$temp";
      case 3:
        return "$temp";
      default:
        return "000";
    }
  }
}

class Helper {
  static int getIdFromUrl(String url) {
    RegExp regex = RegExp(r'/pokemon/(\d+)/');

    Match? match = regex.firstMatch(url);
    if (match != null) {
      String id = match.group(1)!;
      return int.parse(id);
    } else {
      return 0;
    }
  }

  static Color getColorType(String name) {
    switch (name) {
      case "Bug":
        return Palette.bugColor;
      case "Dark":
        return Palette.darkColor;
      case "Dragon":
        return Palette.dragonColor;
      case "Electric":
        return Palette.electricColor;
      case "Fairy":
        return Palette.fairyColor;
      case "Fighting":
        return Palette.fightingColor;
      case "Fire":
        return Palette.bugColor;
      case "Flying":
        return Palette.flyingColor;
      case "Ghost":
        return Palette.ghostColor;
      case "Normal":
        return Palette.normalColor;
      case "Grass":
        return Palette.grassColor;
      case "Ground":
        return Palette.groundColor;
      case "Ice":
        return Palette.iceColor;
      case "Poison":
        return Palette.poisonColor;
      case "Psychic":
        return Palette.psychicColor;
      case "Rock":
        return Palette.rockColor;
      case "Steel":
        return Palette.steelColor;
      case "Water":
        return Palette.waterColor;
      default:
        return Palette.grassColor;
    }
  }
}
