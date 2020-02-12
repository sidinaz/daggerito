import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformTheme{
  final Color primaryColor;
  final Color scaffoldBackgroundColor;
  final Color backgroundColor;
  final TextTheme textTheme;

  PlatformTheme(this.primaryColor, this.scaffoldBackgroundColor, this.backgroundColor, this.textTheme);

  factory PlatformTheme.of(BuildContext context,){

    if(isCupertino(context)){
      final themeData = CupertinoTheme.of(context);
      final primaryColor = themeData.brightness == Brightness.light ? themeData.primaryColor : themeData.primaryContrastingColor;
      final scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
      final backgroundColor = themeData.scaffoldBackgroundColor;
      final textTheme = themeData.textTheme;

      final textTheme2 = TextTheme(title: textTheme.navTitleTextStyle, body1: textTheme.textStyle);
      return PlatformTheme(primaryColor, scaffoldBackgroundColor, backgroundColor, textTheme2);
    }else{
      final themeData = Theme.of(context);
      final primaryColor = themeData.primaryColor;
      final scaffoldBackgroundColor = themeData.scaffoldBackgroundColor;
      final backgroundColor = themeData.backgroundColor;
      final textTheme = themeData.textTheme;
      return PlatformTheme(primaryColor, scaffoldBackgroundColor, backgroundColor, textTheme);
    }
  }
}