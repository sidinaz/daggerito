// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class LocaleDB extends DataClass implements Insertable<LocaleDB> {
  final String id;
  final String description;
  LocaleDB({@required this.id, this.description});
  factory LocaleDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return LocaleDB(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  factory LocaleDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LocaleDB(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  @override
  LocalesCompanion createCompanion(bool nullToAbsent) {
    return LocalesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  LocaleDB copyWith({String id, String description}) => LocaleDB(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('LocaleDB(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, description.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LocaleDB &&
          other.id == this.id &&
          other.description == this.description);
}

class LocalesCompanion extends UpdateCompanion<LocaleDB> {
  final Value<String> id;
  final Value<String> description;
  const LocalesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  LocalesCompanion.insert({
    @required String id,
    this.description = const Value.absent(),
  }) : id = Value(id);
  LocalesCompanion copyWith({Value<String> id, Value<String> description}) {
    return LocalesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }
}

class Locales extends Table with TableInfo<Locales, LocaleDB> {
  final GeneratedDatabase _db;
  final String _alias;
  Locales(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        $customConstraints: 'NOT NULL PRIMARY KEY');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  Locales get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'locales';
  @override
  final String actualTableName = 'locales';
  @override
  VerificationContext validateIntegrity(LocalesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocaleDB map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LocaleDB.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(LocalesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    return map;
  }

  @override
  Locales createAlias(String alias) {
    return Locales(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ThemeDB extends DataClass implements Insertable<ThemeDB> {
  final int id;
  final String description;
  ThemeDB({@required this.id, @required this.description});
  factory ThemeDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ThemeDB(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  factory ThemeDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ThemeDB(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  @override
  ThemesCompanion createCompanion(bool nullToAbsent) {
    return ThemesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  ThemeDB copyWith({int id, String description}) => ThemeDB(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('ThemeDB(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, description.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ThemeDB &&
          other.id == this.id &&
          other.description == this.description);
}

class ThemesCompanion extends UpdateCompanion<ThemeDB> {
  final Value<int> id;
  final Value<String> description;
  const ThemesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  ThemesCompanion.insert({
    this.id = const Value.absent(),
    @required String description,
  }) : description = Value(description);
  ThemesCompanion copyWith({Value<int> id, Value<String> description}) {
    return ThemesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }
}

class Themes extends Table with TableInfo<Themes, ThemeDB> {
  final GeneratedDatabase _db;
  final String _alias;
  Themes(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        declaredAsPrimaryKey: true, $customConstraints: 'NOT NULL PRIMARY KEY');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  Themes get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'themes';
  @override
  final String actualTableName = 'themes';
  @override
  VerificationContext validateIntegrity(ThemesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThemeDB map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ThemeDB.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ThemesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    return map;
  }

  @override
  Themes createAlias(String alias) {
    return Themes(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserDB extends DataClass implements Insertable<UserDB> {
  final String username;
  final int theme;
  final String locale;
  final String platform;
  UserDB({this.username, @required this.theme, this.locale, this.platform});
  factory UserDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return UserDB(
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      theme: intType.mapFromDatabaseResponse(data['${effectivePrefix}theme']),
      locale:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}locale']),
      platform: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}platform']),
    );
  }
  factory UserDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserDB(
      username: serializer.fromJson<String>(json['username']),
      theme: serializer.fromJson<int>(json['theme']),
      locale: serializer.fromJson<String>(json['locale']),
      platform: serializer.fromJson<String>(json['platform']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'username': serializer.toJson<String>(username),
      'theme': serializer.toJson<int>(theme),
      'locale': serializer.toJson<String>(locale),
      'platform': serializer.toJson<String>(platform),
    };
  }

  @override
  UsersCompanion createCompanion(bool nullToAbsent) {
    return UsersCompanion(
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      theme:
          theme == null && nullToAbsent ? const Value.absent() : Value(theme),
      locale:
          locale == null && nullToAbsent ? const Value.absent() : Value(locale),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
    );
  }

  UserDB copyWith(
          {String username, int theme, String locale, String platform}) =>
      UserDB(
        username: username ?? this.username,
        theme: theme ?? this.theme,
        locale: locale ?? this.locale,
        platform: platform ?? this.platform,
      );
  @override
  String toString() {
    return (StringBuffer('UserDB(')
          ..write('username: $username, ')
          ..write('theme: $theme, ')
          ..write('locale: $locale, ')
          ..write('platform: $platform')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(username.hashCode,
      $mrjc(theme.hashCode, $mrjc(locale.hashCode, platform.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserDB &&
          other.username == this.username &&
          other.theme == this.theme &&
          other.locale == this.locale &&
          other.platform == this.platform);
}

class UsersCompanion extends UpdateCompanion<UserDB> {
  final Value<String> username;
  final Value<int> theme;
  final Value<String> locale;
  final Value<String> platform;
  const UsersCompanion({
    this.username = const Value.absent(),
    this.theme = const Value.absent(),
    this.locale = const Value.absent(),
    this.platform = const Value.absent(),
  });
  UsersCompanion.insert({
    this.username = const Value.absent(),
    this.theme = const Value.absent(),
    this.locale = const Value.absent(),
    this.platform = const Value.absent(),
  });
  UsersCompanion copyWith(
      {Value<String> username,
      Value<int> theme,
      Value<String> locale,
      Value<String> platform}) {
    return UsersCompanion(
      username: username ?? this.username,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
      platform: platform ?? this.platform,
    );
  }
}

class Users extends Table with TableInfo<Users, UserDB> {
  final GeneratedDatabase _db;
  final String _alias;
  Users(this._db, [this._alias]);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn('username', $tableName, true,
        $customConstraints: 'PRIMARY KEY');
  }

  final VerificationMeta _themeMeta = const VerificationMeta('theme');
  GeneratedIntColumn _theme;
  GeneratedIntColumn get theme => _theme ??= _constructTheme();
  GeneratedIntColumn _constructTheme() {
    return GeneratedIntColumn('theme', $tableName, false,
        $customConstraints: 'NOT NULL DEFAULT 1 REFERENCES themes(id)',
        defaultValue: const CustomExpression<int, IntType>('1'));
  }

  final VerificationMeta _localeMeta = const VerificationMeta('locale');
  GeneratedTextColumn _locale;
  GeneratedTextColumn get locale => _locale ??= _constructLocale();
  GeneratedTextColumn _constructLocale() {
    return GeneratedTextColumn('locale', $tableName, true,
        $customConstraints: 'REFERENCES locales(id)');
  }

  final VerificationMeta _platformMeta = const VerificationMeta('platform');
  GeneratedTextColumn _platform;
  GeneratedTextColumn get platform => _platform ??= _constructPlatform();
  GeneratedTextColumn _constructPlatform() {
    return GeneratedTextColumn('platform', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [username, theme, locale, platform];
  @override
  Users get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(UsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.username.present) {
      context.handle(_usernameMeta,
          username.isAcceptableValue(d.username.value, _usernameMeta));
    }
    if (d.theme.present) {
      context.handle(
          _themeMeta, theme.isAcceptableValue(d.theme.value, _themeMeta));
    }
    if (d.locale.present) {
      context.handle(
          _localeMeta, locale.isAcceptableValue(d.locale.value, _localeMeta));
    }
    if (d.platform.present) {
      context.handle(_platformMeta,
          platform.isAcceptableValue(d.platform.value, _platformMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {username};
  @override
  UserDB map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserDB.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsersCompanion d) {
    final map = <String, Variable>{};
    if (d.username.present) {
      map['username'] = Variable<String, StringType>(d.username.value);
    }
    if (d.theme.present) {
      map['theme'] = Variable<int, IntType>(d.theme.value);
    }
    if (d.locale.present) {
      map['locale'] = Variable<String, StringType>(d.locale.value);
    }
    if (d.platform.present) {
      map['platform'] = Variable<String, StringType>(d.platform.value);
    }
    return map;
  }

  @override
  Users createAlias(String alias) {
    return Users(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LayoutDB extends DataClass implements Insertable<LayoutDB> {
  final String username;
  final int mainLayout;
  LayoutDB({this.username, this.mainLayout});
  factory LayoutDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return LayoutDB(
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      mainLayout: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}main_layout']),
    );
  }
  factory LayoutDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LayoutDB(
      username: serializer.fromJson<String>(json['username']),
      mainLayout: serializer.fromJson<int>(json['mainLayout']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'username': serializer.toJson<String>(username),
      'mainLayout': serializer.toJson<int>(mainLayout),
    };
  }

  @override
  LayoutsCompanion createCompanion(bool nullToAbsent) {
    return LayoutsCompanion(
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      mainLayout: mainLayout == null && nullToAbsent
          ? const Value.absent()
          : Value(mainLayout),
    );
  }

  LayoutDB copyWith({String username, int mainLayout}) => LayoutDB(
        username: username ?? this.username,
        mainLayout: mainLayout ?? this.mainLayout,
      );
  @override
  String toString() {
    return (StringBuffer('LayoutDB(')
          ..write('username: $username, ')
          ..write('mainLayout: $mainLayout')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(username.hashCode, mainLayout.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LayoutDB &&
          other.username == this.username &&
          other.mainLayout == this.mainLayout);
}

class LayoutsCompanion extends UpdateCompanion<LayoutDB> {
  final Value<String> username;
  final Value<int> mainLayout;
  const LayoutsCompanion({
    this.username = const Value.absent(),
    this.mainLayout = const Value.absent(),
  });
  LayoutsCompanion.insert({
    this.username = const Value.absent(),
    this.mainLayout = const Value.absent(),
  });
  LayoutsCompanion copyWith({Value<String> username, Value<int> mainLayout}) {
    return LayoutsCompanion(
      username: username ?? this.username,
      mainLayout: mainLayout ?? this.mainLayout,
    );
  }
}

class Layouts extends Table with TableInfo<Layouts, LayoutDB> {
  final GeneratedDatabase _db;
  final String _alias;
  Layouts(this._db, [this._alias]);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn('username', $tableName, true,
        $customConstraints: 'PRIMARY KEY REFERENCES users(username)');
  }

  final VerificationMeta _mainLayoutMeta = const VerificationMeta('mainLayout');
  GeneratedIntColumn _mainLayout;
  GeneratedIntColumn get mainLayout => _mainLayout ??= _constructMainLayout();
  GeneratedIntColumn _constructMainLayout() {
    return GeneratedIntColumn('main_layout', $tableName, true,
        $customConstraints: 'DEFAULT 1',
        defaultValue: const CustomExpression<int, IntType>('1'));
  }

  @override
  List<GeneratedColumn> get $columns => [username, mainLayout];
  @override
  Layouts get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'layouts';
  @override
  final String actualTableName = 'layouts';
  @override
  VerificationContext validateIntegrity(LayoutsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.username.present) {
      context.handle(_usernameMeta,
          username.isAcceptableValue(d.username.value, _usernameMeta));
    }
    if (d.mainLayout.present) {
      context.handle(_mainLayoutMeta,
          mainLayout.isAcceptableValue(d.mainLayout.value, _mainLayoutMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {username};
  @override
  LayoutDB map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LayoutDB.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(LayoutsCompanion d) {
    final map = <String, Variable>{};
    if (d.username.present) {
      map['username'] = Variable<String, StringType>(d.username.value);
    }
    if (d.mainLayout.present) {
      map['main_layout'] = Variable<int, IntType>(d.mainLayout.value);
    }
    return map;
  }

  @override
  Layouts createAlias(String alias) {
    return Layouts(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class BookDB extends DataClass implements Insertable<BookDB> {
  final int id;
  final String title;
  final String isbn;
  final String description;
  final DateTime updatedTime;
  final String user;
  BookDB(
      {@required this.id,
      this.title,
      this.isbn,
      this.description,
      @required this.updatedTime,
      @required this.user});
  factory BookDB.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BookDB(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      isbn: stringType.mapFromDatabaseResponse(data['${effectivePrefix}isbn']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      updatedTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_time']),
      user: stringType.mapFromDatabaseResponse(data['${effectivePrefix}user']),
    );
  }
  factory BookDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BookDB(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isbn: serializer.fromJson<String>(json['isbn']),
      description: serializer.fromJson<String>(json['description']),
      updatedTime: serializer.fromJson<DateTime>(json['updatedTime']),
      user: serializer.fromJson<String>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'isbn': serializer.toJson<String>(isbn),
      'description': serializer.toJson<String>(description),
      'updatedTime': serializer.toJson<DateTime>(updatedTime),
      'user': serializer.toJson<String>(user),
    };
  }

  @override
  BooksCompanion createCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      isbn: isbn == null && nullToAbsent ? const Value.absent() : Value(isbn),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      updatedTime: updatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedTime),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
    );
  }

  BookDB copyWith(
          {int id,
          String title,
          String isbn,
          String description,
          DateTime updatedTime,
          String user}) =>
      BookDB(
        id: id ?? this.id,
        title: title ?? this.title,
        isbn: isbn ?? this.isbn,
        description: description ?? this.description,
        updatedTime: updatedTime ?? this.updatedTime,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('BookDB(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isbn: $isbn, ')
          ..write('description: $description, ')
          ..write('updatedTime: $updatedTime, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              isbn.hashCode,
              $mrjc(description.hashCode,
                  $mrjc(updatedTime.hashCode, user.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BookDB &&
          other.id == this.id &&
          other.title == this.title &&
          other.isbn == this.isbn &&
          other.description == this.description &&
          other.updatedTime == this.updatedTime &&
          other.user == this.user);
}

class BooksCompanion extends UpdateCompanion<BookDB> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> isbn;
  final Value<String> description;
  final Value<DateTime> updatedTime;
  final Value<String> user;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isbn = const Value.absent(),
    this.description = const Value.absent(),
    this.updatedTime = const Value.absent(),
    this.user = const Value.absent(),
  });
  BooksCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isbn = const Value.absent(),
    this.description = const Value.absent(),
    @required DateTime updatedTime,
    @required String user,
  })  : updatedTime = Value(updatedTime),
        user = Value(user);
  BooksCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> isbn,
      Value<String> description,
      Value<DateTime> updatedTime,
      Value<String> user}) {
    return BooksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isbn: isbn ?? this.isbn,
      description: description ?? this.description,
      updatedTime: updatedTime ?? this.updatedTime,
      user: user ?? this.user,
    );
  }
}

class Books extends Table with TableInfo<Books, BookDB> {
  final GeneratedDatabase _db;
  final String _alias;
  Books(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _isbnMeta = const VerificationMeta('isbn');
  GeneratedTextColumn _isbn;
  GeneratedTextColumn get isbn => _isbn ??= _constructIsbn();
  GeneratedTextColumn _constructIsbn() {
    return GeneratedTextColumn('isbn', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _updatedTimeMeta =
      const VerificationMeta('updatedTime');
  GeneratedDateTimeColumn _updatedTime;
  GeneratedDateTimeColumn get updatedTime =>
      _updatedTime ??= _constructUpdatedTime();
  GeneratedDateTimeColumn _constructUpdatedTime() {
    return GeneratedDateTimeColumn('updated_time', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _userMeta = const VerificationMeta('user');
  GeneratedTextColumn _user;
  GeneratedTextColumn get user => _user ??= _constructUser();
  GeneratedTextColumn _constructUser() {
    return GeneratedTextColumn('user', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES users(username)');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, isbn, description, updatedTime, user];
  @override
  Books get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'books';
  @override
  final String actualTableName = 'books';
  @override
  VerificationContext validateIntegrity(BooksCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    }
    if (d.isbn.present) {
      context.handle(
          _isbnMeta, isbn.isAcceptableValue(d.isbn.value, _isbnMeta));
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    }
    if (d.updatedTime.present) {
      context.handle(_updatedTimeMeta,
          updatedTime.isAcceptableValue(d.updatedTime.value, _updatedTimeMeta));
    } else if (isInserting) {
      context.missing(_updatedTimeMeta);
    }
    if (d.user.present) {
      context.handle(
          _userMeta, user.isAcceptableValue(d.user.value, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookDB map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BookDB.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BooksCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.isbn.present) {
      map['isbn'] = Variable<String, StringType>(d.isbn.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.updatedTime.present) {
      map['updated_time'] =
          Variable<DateTime, DateTimeType>(d.updatedTime.value);
    }
    if (d.user.present) {
      map['user'] = Variable<String, StringType>(d.user.value);
    }
    return map;
  }

  @override
  Books createAlias(String alias) {
    return Books(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  Locales _locales;
  Locales get locales => _locales ??= Locales(this);
  Themes _themes;
  Themes get themes => _themes ??= Themes(this);
  Users _users;
  Users get users => _users ??= Users(this);
  Layouts _layouts;
  Layouts get layouts => _layouts ??= Layouts(this);
  Books _books;
  Books get books => _books ??= Books(this);
  Future<int> createUser(String username) {
    return customInsert(
      'insert into users(username) values (:username)',
      variables: [Variable.withString(username)],
      updates: {users},
    );
  }

  Future<int> createLayout(String username) {
    return customInsert(
      'insert into layouts(username) values (:username)',
      variables: [Variable.withString(username)],
      updates: {layouts},
    );
  }

  Future<int> updateUserInfo(
      int theme, String locale, String platform, String username) {
    return customUpdate(
      'update users set theme = :theme, locale = :locale, platform = :platform where username = :username',
      variables: [
        Variable.withInt(theme),
        Variable.withString(locale),
        Variable.withString(platform),
        Variable.withString(username)
      ],
      updates: {users},
    );
  }

  Future<int> updateUserLocale(String locale, String username) {
    return customUpdate(
      'update users set locale = :locale where username = :username',
      variables: [Variable.withString(locale), Variable.withString(username)],
      updates: {users},
    );
  }

  Future<int> updateUserTheme(int theme, String username) {
    return customUpdate(
      'update users set theme = :theme where username = :username',
      variables: [Variable.withInt(theme), Variable.withString(username)],
      updates: {users},
    );
  }

  Future<int> updateUserLayout(int main_layout, String username) {
    return customUpdate(
      'update layouts set main_layout = :main_layout where username = :username',
      variables: [Variable.withInt(main_layout), Variable.withString(username)],
      updates: {layouts},
    );
  }

  UserDB _rowToUserDB(QueryRow row) {
    return UserDB(
      username: row.readString('username'),
      theme: row.readInt('theme'),
      locale: row.readString('locale'),
      platform: row.readString('platform'),
    );
  }

  Selectable<UserDB> getUser(String username) {
    return customSelectQuery('select * from users where username = :username',
        variables: [Variable.withString(username)],
        readsFrom: {users}).map(_rowToUserDB);
  }

  LayoutDB _rowToLayoutDB(QueryRow row) {
    return LayoutDB(
      username: row.readString('username'),
      mainLayout: row.readInt('main_layout'),
    );
  }

  Selectable<LayoutDB> getUserLayout(String username) {
    return customSelectQuery('select * from layouts where username = :username',
        variables: [Variable.withString(username)],
        readsFrom: {layouts}).map(_rowToLayoutDB);
  }

  ThemeDB _rowToThemeDB(QueryRow row) {
    return ThemeDB(
      id: row.readInt('id'),
      description: row.readString('description'),
    );
  }

  Selectable<ThemeDB> getThemeById(int id) {
    return customSelectQuery('select * from themes where id = :id',
        variables: [Variable.withInt(id)],
        readsFrom: {themes}).map(_rowToThemeDB);
  }

  Selectable<ThemeDB> getThemes() {
    return customSelectQuery('select * from themes',
        variables: [], readsFrom: {themes}).map(_rowToThemeDB);
  }

  LocaleDB _rowToLocaleDB(QueryRow row) {
    return LocaleDB(
      id: row.readString('id'),
      description: row.readString('description'),
    );
  }

  Selectable<LocaleDB> getLocaleById(String id) {
    return customSelectQuery('select * from locales where id = :id',
        variables: [Variable.withString(id)],
        readsFrom: {locales}).map(_rowToLocaleDB);
  }

  Selectable<LocaleDB> getLocales() {
    return customSelectQuery('select * from locales',
        variables: [], readsFrom: {locales}).map(_rowToLocaleDB);
  }

  BookDB _rowToBookDB(QueryRow row) {
    return BookDB(
      id: row.readInt('id'),
      title: row.readString('title'),
      isbn: row.readString('isbn'),
      description: row.readString('description'),
      updatedTime: row.readDateTime('updated_time'),
      user: row.readString('user'),
    );
  }

  Selectable<BookDB> getBook(int id) {
    return customSelectQuery('select * from books where id = :id',
        variables: [Variable.withInt(id)],
        readsFrom: {books}).map(_rowToBookDB);
  }

  Selectable<BookDB> getBooks(String user) {
    return customSelectQuery(
        'select * from books where user = :user order by updated_time desc',
        variables: [Variable.withString(user)],
        readsFrom: {books}).map(_rowToBookDB);
  }

  Selectable<UserDB> getUsers() {
    return customSelectQuery('select * from users',
        variables: [], readsFrom: {users}).map(_rowToUserDB);
  }

  Future<int> createBook(String title, String isbn, String description,
      DateTime updated_time, String user) {
    return customInsert(
      'insert into books(title, isbn, description, updated_time, user) values(:title, :isbn, :description, :updated_time, :user)',
      variables: [
        Variable.withString(title),
        Variable.withString(isbn),
        Variable.withString(description),
        Variable.withDateTime(updated_time),
        Variable.withString(user)
      ],
      updates: {books},
    );
  }

  Future<int> updateBook(String title, String isbn, String description,
      DateTime updated_time, int id) {
    return customUpdate(
      'update books set title = :title, isbn = :isbn, description = :description, updated_time = :updated_time where id = :id',
      variables: [
        Variable.withString(title),
        Variable.withString(isbn),
        Variable.withString(description),
        Variable.withDateTime(updated_time),
        Variable.withInt(id)
      ],
      updates: {books},
    );
  }

  Future<int> deleteBookById(int id) {
    return customUpdate(
      'delete from books where id = :id',
      variables: [Variable.withInt(id)],
      updates: {books},
    );
  }

  Future<int> deleteUser(String username) {
    return customUpdate(
      'delete from users where username = :username',
      variables: [Variable.withString(username)],
      updates: {users},
    );
  }

  Future<int> deleteLayout(String username) {
    return customUpdate(
      'delete from layouts where username = :username',
      variables: [Variable.withString(username)],
      updates: {users},
    );
  }

  Future<int> deleteUserBooks(String user) {
    return customUpdate(
      'delete from books where user = :user',
      variables: [Variable.withString(user)],
      updates: {users},
    );
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [locales, themes, users, layouts, books];
}
