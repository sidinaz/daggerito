import 'package:example/features/debug/view/view.dart';
import 'package:flutter/material.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

class HomeController extends Controller {
  @override
  void bindRouter(Router router) {
    router.route("/home").handler(homeHandler);
    router.route("/debug").handler(debugHandler);
  }

  WidgetBuilder homeHandler(RoutingContext context) =>
      (_) => context("HomeView");

  WidgetBuilder debugHandler(RoutingContext context) =>
      (_) => context<DebugView>();
}
