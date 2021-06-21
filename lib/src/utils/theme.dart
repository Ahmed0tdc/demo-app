import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/palette.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';

class MyTheme {
  ThemeData _theme = ThemeData(
    fontFamily: mainFontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Palette.transparentColor,
      elevation: 0.0,
      
    ),
  );

  // getters
  ThemeData get getTheme => _theme;
}
