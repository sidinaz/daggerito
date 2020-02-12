import 'database.dart';
import 'model/user_info.dart';

class UserSettingsRepository {
  final AppDb _appDb;
  final UserEntity _userEntity;

  get username => _userEntity.username;

  UserSettingsRepository(this._appDb, this._userEntity);

  Stream<int> updateUserLayout({int mainLayout}) =>
      _appDb.updateUserLayout(mainLayout, username).asStream();

  Stream<int> updateUserInfo({int theme, String locale, String platform}) =>
      _appDb.updateUserInfo(theme, locale, platform, username).asStream();
}
