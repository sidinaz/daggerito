import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class UserInfoAlert{
  final UserInfo userInfo;
  UserInfoAlert(this.userInfo);
  void show(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: PlatformText(Messages.current.debug),
        content: PlatformText(userInfo.userDB.username),
        actions: <Widget>[
          PlatformDialogAction(
            android: (_) => MaterialDialogActionData(),
            ios: (_) => CupertinoDialogActionData(),
            child: PlatformText(Messages.current.ok),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

}