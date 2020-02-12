import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeManager {
  Brightness brightness;
  final ThemeData materialTheme;
  final ThemeData materialDarkTheme;
  final CupertinoThemeData cupertinoTheme;
  final TargetPlatform targetPlatform;

  ThemeManager._(this.brightness, this.materialTheme, this.materialDarkTheme,
      this.cupertinoTheme, this.targetPlatform);

  static const materialThemePrimarySwatchColor = null;

//  static const materialThemePrimarySwatchColor = Colors.purple;
  static const materialDarkThemePrimarySwatchColor = Colors.teal;
  static const cupertinoThemePrimarySwatchColor = Color(0xff007aff);

//  static const cupertinoThemePrimarySwatchColor = Colors.purple;
  static const cupertinoDarkThemePrimarySwatchColor = Colors.cyan;

  factory ThemeManager({int theme = 1, String platform}) {
    final brightness = theme != 10 ? Brightness.light : Brightness.dark;

    final TargetPlatform targetPlatform = platform != null
        ? platform == "ios" ? TargetPlatform.iOS : TargetPlatform.android
        : null;

    final materialTheme = ThemeData(
      primarySwatch: materialThemePrimarySwatchColor,
    );

    final materialDarkTheme = new ThemeData(
      brightness: Brightness.dark,
      primarySwatch: materialDarkThemePrimarySwatchColor,
    );

    final cupertinoTheme = new CupertinoThemeData(
        brightness: brightness,
        primaryColor: CupertinoDynamicColor.withBrightness(
          color: cupertinoThemePrimarySwatchColor,
          darkColor: cupertinoDarkThemePrimarySwatchColor,
        ));
    return ThemeManager._(brightness, materialTheme, materialDarkTheme,
        cupertinoTheme, targetPlatform);
  }
}
