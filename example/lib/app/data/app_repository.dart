import 'package:example/app/database/database.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/util/default_shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class AppRepository {
  static const _userKey = "user";
  final DefaultSharedPreferences _defaultSharedPreferences;
  final AppDb _appDb;

  AppRepository(
    this._defaultSharedPreferences,
    this._appDb,
  );

  Stream<String> getUser() =>
      Stream.value(_defaultSharedPreferences.getString(_userKey))
          .map(($) => $ != null ? $ : throw "User is missing");

  Stream<UserInfo> getUserInfo() => getUser()
      .flatMap(_getUser)
      .map((user) => user != null ? user : throw "User is missing")
      .flatMap(
        (user) => _appDb
            .getUserLayout(user.username)
            .getSingle()
            .asStream()
            .map((layout) => UserInfo(user, layout)),
      );

  Stream<UserDB> _getUser(String username) =>
      _appDb.getUser(username).getSingle().asStream();

  Stream<List<UserDB>> getAllUsers() => _appDb.getUsers().watch();

  Stream<bool> login(String user) =>
      _defaultSharedPreferences.setString(_userKey, user).asStream();

  Stream<bool> logOut() =>
      _defaultSharedPreferences.remove(_userKey).asStream();

  Stream<int> createUser(String username) => _appDb
      .createUser(username)
      .asStream()
      .flatMap((_) => _appDb.createLayout(username).asStream());

  Stream<int> deleteUser(String username) => Rx.concat(
        [
          _appDb.deleteLayout(username).asStream(),
          _appDb.deleteUserBooks(username).asStream(),
          _appDb.deleteUser(username).asStream(),
        ],
      ).toList().asStream().map(($) => $.last);
}
