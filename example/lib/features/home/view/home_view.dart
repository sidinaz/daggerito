import 'package:example/app/theme/theme_manager.dart';
import 'package:example/app/ui/check_platform_mixin.dart';
import 'package:example/features/home/data/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class HomeView extends BaseView with CheckPlatformMixin {
  final HomeViewModel model;
  final WidgetBuilder drawer;
  final ThemeManager themeManager;

  HomeView(this.model, this.drawer, this.themeManager);

  Widget buildForPortrait(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      body: buildMainContent(context),
    );
  }

  Widget buildForLandscape(BuildContext context) => Scaffold(
        body: Row(
          children: <Widget>[
            drawer(context),
            Expanded(
              child: buildMainContent(context),
            )
          ],
        ),
      );

  Widget buildMainContent(BuildContext context) => Observer<String>(
        stream: model.currentPage,
        onSuccess: (ctx, currentScreen) => managedView(currentScreen)(ctx),
      );

  @override
  Widget buildWidget(BuildContext context) => OrientationLayout(
        landscape: (ctx) => buildForLandscape(ctx),
        portrait: (ctx) => buildForPortrait(ctx),
      );

  @override
  void componentDidMount() {
    checkPlatform(themeManager);
  }

  void openDrawer(BuildContext context) =>
      Scaffold.of(context).openDrawer();
}

