import 'package:example/app/data/app_repository.dart';
import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/util/validators_helper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

import './model.dart';

class PublicViewModel extends BaseViewModel<SingleItemsModel> {
  static const usernameMinLength = 5;
  final CreateUserInput input;
  final AppRepository appRepository;
  final Messages messages;
  @override
  final data = SingleItemsModel<UserDB>();

  // ignore: close_sinks
  final _userSaved = PublishSubject<int>();

  // ignore: close_sinks
  final _isValidSubject = BehaviorSubject<bool>();

  Stream<bool> get isValid => _isValidSubject.startWith(false);

  Stream<int> get userSaved => _userSaved;

  PublicViewModel(this.appRepository, this.input, this.messages);

  get usernameUI => input.username.map(usernameValidatorAsString).asSignal();

  @override
  void start() {
    disposeBag.addAll([
      appRepository.getAllUsers().listen(data.setItems),
      input.username
          .map((username) => usernameValidator()(username))
          .distinct()
          .listen(_isValidSubject.add),
      input.saveUserTap
          .withLatestFrom(input.username, (_, String username) => username)
          .flatMap(createUser)
          .listen(_userSaved.add),
    ]);
  }

  Stream<int> deleteUser(String user) => appRepository.deleteUser(user);

  Stream<bool> logIn(String user) => appRepository.login(user);

  Stream<bool> logOut(String user) => appRepository.logOut();

  Stream<int> createUser(String user) => appRepository.createUser(user);

  String usernameValidatorAsString(String value) =>
      TextFieldValidator(usernameValidator(),
          errorText: messages.validationMinNCharacters(usernameMinLength), ignoreEmptyValues: false)(value);

  Validator usernameValidator() => MinLengthValidator(usernameMinLength);
}
