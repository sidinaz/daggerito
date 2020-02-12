import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

import '../data/view_model.dart';

// ignore: must_be_immutable
class PublicView extends BaseView {
  final PublicViewModel model;
  final title = Messages.current.users;

  PublicView(this.model);

  Widget buildAddButton(BuildContext context) => PlatformIconButton(
        icon: Icon(
          context.platformIcons.add,
        ),
        onPressed: addNewUser,
      );

  Widget buildLoginButton(BuildContext context, UserDB user) => FlatButton(
        child: Text(Messages.current.login),
        onPressed: () => login(user),
      );

  Widget buildDeleteButton(BuildContext context, UserDB user) =>
      PlatformIconButton(
        icon: Icon(
          Icons.delete,
        ),
        onPressed: () => _showPopupSheet(user),
      );

  Widget buildDebugButton(BuildContext context) => FlatButton(
        child: PlatformText(Messages.current.debug),
        onPressed: () => RoutexNavigator.shared.push("/public/debug", context),
      );

  @override
  Widget buildWidget(BuildContext context) => OrientationLayout(
        portrait: (ctx) => PlatformScaffold(
          android: (context) => MaterialScaffoldData(
              floatingActionButton: FloatingActionButton(
            onPressed: () =>
                RoutexNavigator.shared.push("/public/debug", context),
            child: Icon(Icons.view_week),
          )),
          appBar: buildPlatformAppBar(ctx),
          body: buildBodyContent(),
        ),
        landscape: (_) => PlatformScaffold(
          body: buildBodyContent(),
        ),
      );

  Widget buildBodyContent() => Observer<List<UserDB>>(
        stream: model().items,
        onSuccess: (context, items) => ListView.builder(
          itemBuilder: (context, index) => Card(
              child: ListTile(
            title: Text(items[index].username),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildLoginButton(context, items[index]),
                buildDeleteButton(context, items[index]),
              ],
            ),
          )),
          itemCount: items.length,
        ),
      );

  PlatformAppBar buildPlatformAppBar(BuildContext context) => PlatformAppBar(
        trailingActions: <Widget>[
          buildAddButton(context),
        ],
        title: PlatformText(title),
        ios: (context) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
          leading: buildDebugButton(context),
        ),
      );

  void addNewUser() {
    RoutexNavigator.shared.push("/public/create-user", context);
  }

  void deleteUser(UserDB user) {
    disposeBag.add(this.model.deleteUser(user.username).listen(($) {
      Navigator.pop(context);
    }));
  }

  void login(UserDB user) {
    model.logIn(user.username).listen((_) {
      EventBus().push(AppEvent(AppEventType.LOG_IN));
    });
  }

  void _showPopupSheet(UserDB model) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: PlatformText(Messages.current.delete),
        content: PlatformText(model.username),
        actions: <Widget>[
          PlatformDialogAction(
            android: (_) => MaterialDialogActionData(),
            ios: (_) => CupertinoDialogActionData(),
            child: PlatformText(Messages.current.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          PlatformDialogAction(
            child: PlatformText(Messages.current.ok),
            onPressed: () => deleteUser(model),
          ),
        ],
      ),
    );
  }
}
