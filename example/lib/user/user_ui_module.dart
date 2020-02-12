import 'package:daggerito/daggerito.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/locale/locale_manager.dart';
import 'package:example/app/theme/theme_manager.dart';
import 'package:example/app/ui/layout_manager.dart';
import 'package:flutter/material.dart';

class UserUIModule implements Module {
  final UserInfo userInfo;

  UserUIModule({@required this.userInfo});

  @override
  void register(DependencyContainer container) {
    container.register(($) => userInfo);
    container.registerSingleton(
        ($) => LocaleManager.getLocale(userInfo.userDB.locale));

    container.registerSingleton(provideThemeManager);
    container.registerSingleton(provideLayoutManager);

  }

  ThemeManager provideThemeManager(DependencyContainer $) => ThemeManager(
        theme: $<UserInfo>().lookGC.theme,
        platform: $<UserInfo>().lookGC.platform,
      );

  LayoutManager provideLayoutManager(DependencyContainer $) =>
    LayoutManager($<UserInfo>().layoutDB);
}
