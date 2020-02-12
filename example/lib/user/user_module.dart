import 'package:daggerito/daggerito.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/database/user_settings_repository.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/features/debug/view/user_info_alert.dart';
import 'package:example/features/settings/data/data.dart';
import 'package:example/features/settings/view/settings_view.dart';
import 'package:example/user/user_repository.dart';

class UserModule implements Module {
  final UserEntity _user;

  UserModule(this._user);

  @override
  void register(DependencyContainer container) {
    container.register((_) => _user);
    container.register(($) => UserSettingsRepository($(), $()));
    container.register(($) => SettingsViewModel($(), $()));
    container.register(($) => SettingsView($()));
    container.register(($) => UserRepository($(), $(), $()));
    container.register(($) => UserInfoAlert($()));
    container.register((_) => Messages.current);

  }
}
