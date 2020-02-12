import 'package:example/app/entities/entities.dart';
import 'package:example/app/util/book_validators_helper.dart';
import 'package:example/features/book/data/model.dart';
import 'package:example/user/user_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';


class BooksViewModel extends BaseViewModel {
  final BookInput input;
  final BookValidatorsHelper validatorsHelper;
  final UserRepository userRepository;
  final BookDB book;

  int get bookId => book != null ? book.id : null;

  // ignore: close_sinks
  final _bookSaved = PublishSubject<int>();
  // ignore: close_sinks
  final _isValidSubject = BehaviorSubject<bool>();
  Stream<bool> get isValid => _isValidSubject;
  Stream<int> get bookSaved => _bookSaved;

  BooksViewModel(BookSink sink, this.book, this.validatorsHelper, this.userRepository)
      : this.input = BookInput(
          title: sink.title,
          isbn: sink.isbn,
          description: sink.description,
          saveBookTap: sink.saveBookTap,
        );

  get titleUI =>
      input.title.map(validatorsHelper.titleValidatorAsString).asSignal();

   get isbnUI =>
      input.isbn.map(validatorsHelper.isbnValidatorAsString).asSignal();

   get descriptionUI =>
      input.description.map(validatorsHelper.descriptionValidatorAsString).asSignal();

  @override
  void start() {
    disposeBag.addAll([
      Rx.combineLatest3(
        input.title,
        input.isbn,
        input.description,
        (title, isbn, description) =>
            validatorsHelper.titleValidator()(title) &&
            validatorsHelper.isbnValidator().item1(isbn) &&
                validatorsHelper.descriptionValidator()(description)
      ).distinct().listen(_isValidSubject.add),
      input.saveBookTap
          .withLatestFrom3(input.title, input.isbn, input.description,
              (_, title, isbn, description) => Tuple3(title, isbn, description))
          .flatMap(($) => userRepository.addOrUpdateBook(
                id: bookId,
                title: $.item1,
                isbn: $.item2,
                description: $.item3,
              ))
          .listen(_bookSaved.add),
    ]);
  }
}