import 'package:example/app/entities/entities.dart';
import 'package:example/app/ui/book_validators_expandable_item_view.dart';
import 'package:kohana/kohana.dart';

class BookInput {
  final Stream<String> isbn;
  final Stream<String> title;
  final Stream<String> description;
  final Stream<Signal> saveBookTap;

  BookInput({this.isbn, this.title, this.description, this.saveBookTap});
}

class BookSink extends Sink3<String, String, String> with SingleEventSinkMixin {
  Stream<String> get title => item1;

  Stream<String> get isbn => item2;

  Stream<String> get description => item3;

  Stream<Signal> get saveBookTap => event;

  get addTitle => add1;

  get addIsbn => add2;

  get addDescription => add3;

  get addBookSaveTap => addEvent;

  BookSink(BookDB book)
      : super(
          seed1: book != null ? book.title : "",
          seed2: book != null ? book.isbn : "",
          seed3: book != null ? book.description : "",
        );
}
