import 'package:example/app/locale/i18n.dart';
import 'package:example/app/theme/platform_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class MoreView extends BaseView {
  final title = Messages.current.more;

  @override
  Widget buildWidget(BuildContext context) => PlatformScaffold(
    iosContentPadding: true,
        appBar: PlatformAppBar(
          ios: (context) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
          title: PlatformText(title),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 250,
              maxHeight: 250,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PlatformIconButton(
                        ios: (ctx) => CupertinoIconButtonData(),
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          context.platformIcons.settings,
                          size: 50,
                        ),
                          onPressed: () => RoutexNavigator.shared
                              .push("/app/settings/", context)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(Messages.current.settings),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PlatformIconButton(
                        ios: (ctx) => CupertinoIconButtonData(),
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.exit_to_app,
                          size: 50,
                        ),
                        onPressed: (){
//                          Navigator.of(context).pop();
                          EventBus().push(AppEvent(AppEventType.LOG_OUT));
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(Messages.current.logout),
                    ],
                  ),
                )              ],
            ),
          ),
        ),
      );
}
