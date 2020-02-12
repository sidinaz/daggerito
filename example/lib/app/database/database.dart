import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@UseMoor(
  // relative import for the moor file. Moor also supports `package:`
  // imports
  include: {'app_database.moor'},
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onUpgrade: (m, a, b) async => m.createAllTables(),
      beforeOpen: (od) async {
        if (od.wasCreated) {
          await into(users).insert(UserDB(
            username: "app_user",
          ));
          await into(layouts).insert(LayoutDB(
            username: "app_user",
            mainLayout: 1,
          ));
          await into(users).insert(
              UserDB(username: "app_android_user", platform: "android"));
          await into(layouts).insert(LayoutDB(
            username: "app_android_user",
            mainLayout: 1,
          ));
          await into(users)
              .insert(UserDB(username: "app_ios_user", platform: "ios"));
          await into(layouts).insert(LayoutDB(
            username: "app_ios_user",
            mainLayout: 1,
          ));
          await into(themes).insert(ThemeDB(
            id: 1,
            description: 'Default light theme',
          ));
          await into(themes).insert(ThemeDB(
            id: 10,
            description: 'Default dark theme',
          ));
          await into(locales).insert(LocaleDB(
            id: 'bs',
            description: 'Bosanski',
          ));
          await into(locales).insert(LocaleDB(
            id: 'en',
            description: 'English',
          ));
        }
      });
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'daggerito_example_app.sqlite'));
    return VmDatabase(file);
  });
}

class LayoutGC with EquatableMixin {
  String username;
  int mainLayout;

  LayoutGC({this.username, this.mainLayout});

  factory LayoutGC.fromLayoutDb(LayoutDB layoutDB) => LayoutGC(
        username: layoutDB.username,
        mainLayout: layoutDB.mainLayout,
      );

  LayoutGC clone() => LayoutGC(username: username, mainLayout: mainLayout);

  @override
  List get props => [username, mainLayout];

  @override
  String toString() {
    return 'LayoutGC{username: $username, mainLayout: $mainLayout}';
  }
}

class LookGC with EquatableMixin {
  int theme;
  String locale;
  String platform;

  LookGC({this.theme, this.locale, this.platform});

  factory LookGC.fromUserDb(UserDB userDB) => LookGC(
      theme: userDB.theme, locale: userDB.locale, platform: userDB.platform);

  LookGC clone() => LookGC(theme: theme, locale: locale, platform: platform);

  @override
  List get props => [theme, locale, platform];

  @override
  String toString() {
    return 'LookGC{theme: $theme, locale: $locale, platform: $platform}';
  }
}
