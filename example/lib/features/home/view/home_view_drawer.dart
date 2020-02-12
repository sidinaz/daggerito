import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/theme/platform_theme.dart';
import 'package:example/features/debug/view/user_info_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

import '../data/sink.dart';

// ignore: must_be_immutable
class HomeViewDrawer extends BaseView {
  final Sink sink;
  final UserInfo userInfo;
  final UserInfoAlert userInfoAlert;

  HomeViewDrawer(this.sink, this.userInfo, this.userInfoAlert);

  @override
  Widget buildWidget(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait
          ? buildForPortrait(context)
          : buildForLandscape(context);

  Widget buildForPortrait(BuildContext context) => Container(
        height: double.infinity,
        color: PlatformTheme.of(context).scaffoldBackgroundColor,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: buildMainContent(context),
        ),
      );

  Widget buildForLandscape(BuildContext context) => ScreenTypeLayout(
        mobile: Container(
          height: double.infinity,
          width: 80,
          child: buildMainContentMobileLandscape(context),
        ),
        tablet: Container(
          height: double.infinity,
          width: 250,
          child: buildMainContent(context),
        ),
      );

  Widget buildMainContent(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildHeader(context),
            Divider(
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              child: Observer(
                stream: sink.selectedMenu,
                onSuccess: (ctx, selectedMenu) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.library_books,
                      ),
                      title: Text(
                        Messages.current.listBooks,
                      ),
                      onTap: () => onClickMenu("/app/books/list/", context),
                      selected: selectedMenu == null ||
                          selectedMenu == "/app/books/list/",
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                      ),
                      title: Text(
                        Messages.current.debug,
                      ),
                      onTap: () => onClickMenu("/app/debug", context),
                      selected:
                          selectedMenu == null || selectedMenu == "/app/debug",
                    ),
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                      ),
                      title: Text(
                        Messages.current.settings,
                      ),
                      onTap: () => popAndPush("/app/settings/", context),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                      ),
                      title: Text(
                        Messages.current.logout,
                      ),
                      onTap: () {
                        pop(context);
                        EventBus().push(AppEvent(AppEventType.LOG_OUT));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildMainContentMobileLandscape(BuildContext context) =>
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: 50,
              child: Observer(
                stream: sink.selectedMenu,
                onSuccess: (ctx, selectedMenu) => Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: buttonColor(context),
                      ),
                      onPressed: () => userInfoAlert.show(context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.library_books,
                        color: buttonColor(
                          context,
                          selectedMenu == null ||
                              selectedMenu == "/app/books/list/",
                        ),
                      ),
                      onPressed: () => onClickMenu("/app/books/list/", context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.info,
                        color: buttonColor(
                          context,
                          selectedMenu == null || selectedMenu == "/app/debug",
                        ),
                      ),
                      onPressed: () => onClickMenu("/app/debug", context),
                    ),
                    Divider(
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                      ),
                      onPressed: () => popAndPush("/app/settings/", context),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                      ),
                      onPressed: () {
                        pop(context);
                        EventBus().push(AppEvent(AppEventType.LOG_OUT));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  void onClickMenu(String menu, BuildContext context) {
    pop(context);
    sink.addNavigationSelection(menu);
  }

  void popAndPush(String menu, BuildContext context) {
    pop(context);
    RoutexNavigator.shared.push(menu, context);
  }

  void pop(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      Navigator.of(context).pop();
    }
  }

  Color buttonColor(
    BuildContext context,
    [bool selected = false]
  ) =>
      selected ? Theme.of(context).primaryColor : null;

  Widget buildHeader(BuildContext context) => GestureDetector(
    onTap: () => userInfoAlert.show(context),
    child: Container(
          height: 75,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformText(userInfo.userEntity.username),
            ),
          ),
        ),
  );
}
