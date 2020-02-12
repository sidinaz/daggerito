import 'package:example/app/bootstrap/titanium_app.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/di/app_component.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/layout_manager.dart';
import 'package:example/features/book/component.dart';
import 'package:example/features/debug/view/debug_widget.dart';
import 'package:example/user/user_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class PublicDebugView extends StatelessWidget {
  final title = Messages.current.debug;

  @override
  Widget build(BuildContext context) => OrientationLayout(
        portrait: (ctx) => PlatformScaffold(
          appBar: buildPlatformAppBar(ctx),
          body: DebugWidget(),
        ),
        landscape: (_) => PlatformScaffold(
          body: DebugWidget(),
        ),
      );

  PlatformAppBar buildPlatformAppBar(BuildContext context) => PlatformAppBar(
        ios: (context) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
        title: PlatformText(title),
      );
}
