import 'package:flutter/material.dart';

class _ThemeFactory{
  static ThemeData getThemeFromIntValue(int id) => _availableThemes[id - 1];
}

final _defaultThemeGreen = ThemeData(
  primarySwatch: Colors.green,
  accentColor: Colors.deepOrange,
  fontFamily: 'Lato',
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
//      TargetPlatform.android: CustomPageTransitionBuilder(),
//      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
);

final _defaultThemeBlue = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.deepOrange,
  fontFamily: 'Lato',
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
//      TargetPlatform.android: CustomPageTransitionBuilder(),
//      TargetPlatform.iOS: CustomPageTransitionBuilder(),
    },
  ),
);

final _availableThemes = [_defaultThemeGreen, _defaultThemeBlue];