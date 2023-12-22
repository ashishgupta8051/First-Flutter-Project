import 'dart:ui';

class HexColor extends Color {
  HexColor(final String color) : super(_getColorFromHex(color));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    return int.parse(hexColor, radix: 16);
  }
}
