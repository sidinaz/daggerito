import 'package:example/features/debug/view/view.dart';
import 'package:example/features/public/view/create_user_view.dart';
import 'package:example/features/public/view/debug_view.dart';
import 'package:flutter/material.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';
import './view/view.dart';

class PublicController extends Controller {
  @override
  void bindRouter(Router router) {
    router.route("/public/").handler(mainHandler);
    router.route("/public/create-user").handler(createUserHandler);
    router.route("/public/debug").handler(debugHandler);
  }

  WidgetBuilder mainHandler(RoutingContext context) =>
      (_) => context<PublicView>();

  WidgetBuilder createUserHandler(RoutingContext context) =>
      (_) => context<CreateUserView>();

  WidgetBuilder debugHandler(RoutingContext context) =>
          (_) => context<PublicDebugView>();
}