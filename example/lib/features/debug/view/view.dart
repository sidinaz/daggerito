import 'package:example/app/bootstrap/titanium_app.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/di/app_component.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/layout_manager.dart';
import 'package:example/features/book/component.dart';
import 'package:example/features/debug/view/debug_widget.dart';
import 'package:example/features/debug/view/user_info_alert.dart';
import 'package:example/user/user_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class DebugView extends BaseView {
  final title = Messages.current.debug;
  final LayoutManager layout;
  final UserInfo userInfo;
  final UserInfoAlert userInfoAlert;

  DebugView(this.layout, this.userInfo, this.userInfoAlert);

  @override
  Widget buildWidget(BuildContext context) => OrientationLayout(
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
        leading: buildOffstage(context),
        trailingActions: <Widget>[
          Center(
              child: FlatButton(
                child: PlatformText(userInfo.userEntity.username),
                onPressed: () => userInfoAlert.show(context),
              ))

        ],
        title: PlatformText(title),
      );

  Widget buildOffstage(BuildContext context) => layout.mainLayout == 1
      ? PlatformIconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
//            color: Theme.of(context).primaryColor,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        )
      : null;
}
