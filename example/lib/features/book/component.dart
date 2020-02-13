import 'package:daggerito/daggerito.dart';
import 'package:example/app/database/database.dart';
import 'package:example/app/ui/book_validators_expandable_item_view.dart';
import 'package:example/features/book/module.dart';
import 'package:example/user/user_component.dart';

class BookComponent extends SubComponent {
  static var counter = 0;

  BookComponent(
    UserComponent userComponent, {
    BookValidators bookValidators,
    BookDB book,
  }) : super(
          [
            userComponent,
          ],
          modules: [
            BooksModule(
              bookValidators: bookValidators,
              book: book,
            ),
          ],
          silent: true,
        ) {
    counter++;
  }
}
