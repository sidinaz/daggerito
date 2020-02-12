import 'package:example/app/database/database.dart';
import 'package:example/app/database/model/user_info.dart';
import 'package:example/app/util/clock.dart';

class UserRepository {
  final AppDb _appDb;
  final Clock clock;
  final UserEntity _userEntity;

  get username => _userEntity.username;

  UserRepository(this._appDb, this.clock, this._userEntity);

  Stream<int> addOrUpdateBook(
          {int id, String title, String isbn, String description}) =>
      id == null
          ? _appDb
              .createBook(title, isbn, description, clock.currentTime(), username)
              .asStream()
          : _appDb
              .updateBook(title, isbn, description, clock.currentTime(), id)
              .asStream();

  Stream<List<BookDB>> getAllBooks() => _appDb.getBooks(username).watch();

  Stream<int> deleteBookById(int id) => _appDb.deleteBookById(id).asStream();
}
