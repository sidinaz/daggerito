import 'package:example/features/home/view/more_view.dart';
import 'package:example/features/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

class SettingsController extends Controller{
  @override
  void bindRouter(Router router) {
    router.route("/settings/").handler(indexHandler);
    router.route("/more").handler(moreHandler);
  }
  WidgetBuilder indexHandler(RoutingContext context) =>
      (_) => context<SettingsView>();

  WidgetBuilder moreHandler(RoutingContext context) =>
      (_) => MoreView();
}