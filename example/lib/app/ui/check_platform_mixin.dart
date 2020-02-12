import 'package:example/app/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

mixin CheckPlatformMixin<T extends BaseViewModel> on BaseView<T> {
  static const interval = Duration(milliseconds: 10);
  static var promjenutoPuta = 0;

  void _checkPlatform(ThemeManager themeManager) {
    final providerState = PlatformProvider.of(context);
    final platform = themeManager.targetPlatform;
    if (providerState != null) {
      if (providerState.platform != platform) {
        if (platform == TargetPlatform.android) {
          providerState.changeToMaterialPlatform();
        } else if (platform == TargetPlatform.iOS) {
          providerState.changeToCupertinoPlatform();
        } else {
          providerState.changeToAutoDetectPlatform();
        }
      }
    }
  }

  void checkPlatform(ThemeManager themeManager) {
    disposeBag.addAll([
      Stream.value("")
          .delay(CheckPlatformMixin.interval)
          .map((_) => themeManager)
          .listen(_checkPlatform),
    ]);
  }
}
