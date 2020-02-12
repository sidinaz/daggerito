import '../database.dart';

class UserInfo {
  final UserDB userDB;
  final LayoutDB layoutDB;
  final UserEntity userEntity;
  final LookGC lookGC;

  UserInfo(UserDB userDB, this.layoutDB)
      : this.userDB = userDB,
        this.lookGC = LookGC.fromUserDb(userDB),
        userEntity = UserEntity(userDB.username);

  @override
  String toString() {
    return 'UserInfo{, layoutDB: $layoutDB, lookGC: $lookGC}';
  }
}

class UserEntity {
  final String username;

  UserEntity(this.username);
}
