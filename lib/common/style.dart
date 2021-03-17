import 'package:flutter/material.dart';

class StyleUi {
  const StyleUi();

  static const primaryColor = const Color(0xFF673ab7);
  static const primaryDarkColor = const Color(0xFF320b86);
  static const secondaryColor = const Color(0xFF78909c);
  static const accentColor = const Color(0xFF9a67ea);
  static const backgroudColor = const Color(0xFFf5f5f5);

  static const String _fontName1 = 'Merriweather';
  static const String _fontName2 = 'LibreFranklin';

  static const textTheme = TextTheme(
    headline1: TextStyle(
        fontFamily: _fontName1,
        fontSize: 92,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: TextStyle(
        fontFamily: _fontName1,
        fontSize: 57,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: TextStyle(
      fontFamily: _fontName1,
      fontSize: 46,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
        fontFamily: _fontName1,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: TextStyle(
      fontFamily: _fontName1,
      fontSize: 23,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
        fontFamily: _fontName1,
        fontSize: 19,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontFamily: _fontName1,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontFamily: _fontName1,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontFamily: _fontName2,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontFamily: _fontName2,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: TextStyle(
        fontFamily: _fontName2,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: TextStyle(
        fontFamily: _fontName2,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: TextStyle(
        fontFamily: _fontName2,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );
}
