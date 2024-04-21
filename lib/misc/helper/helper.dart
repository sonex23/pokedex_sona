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
}
