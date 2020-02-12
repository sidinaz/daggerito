import 'package:daggerito/daggerito.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/features/debug/view/user_info_alert.dart';
import 'package:example/features/debug/view/view.dart';
import 'package:example/features/home/view/home_view.dart';
import 'package:example/features/home/view/home_view_drawer.dart';
import 'package:example/features/home/view/home_view_with_tabs.dart';
import 'package:example/features/home/view/tabs_helper.dart';
import 'package:flutter/material.dart';

import './data/sink.dart';
import 'data/view_model.dart';

class HomeModule implements Module {
  @override
  void register(DependencyContainer container) {
    container.register(provideHomeView, tag: "HomeView");
    container.registerSingleton(($) => Sink(seed1: "/app/books/list/"));
    container.registerSingleton(($) => HomeViewModel($()));
    container.register(provideDrawerWidgetBuilder);
    container.registerSingleton((_) => TabsHelper());
    container.register(($) => DebugView($(), $(),$()));
  }

  WidgetBuilder provideDrawerWidgetBuilder(DependencyContainer $) =>
      (_) => HomeViewDrawer($(),$(),$());

  Widget provideHomeView(DependencyContainer $) =>
      $<UserInfo>().layoutDB.mainLayout == 1
          ? HomeView($(), $(), $())
          : HomeViewWithTabs($(),$());
}
