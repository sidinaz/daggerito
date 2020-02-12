import 'package:daggerito/daggerito.dart';
import 'package:example/app/entities/entities.dart';
import 'package:example/app/ui/book_validators_expandable_item_view.dart';
import 'package:example/app/util/book_validators_helper.dart';
import 'package:example/features/book/add/view/view.dart';
import 'package:example/features/book/data/model.dart';
import 'package:example/features/book/data/view_model.dart';
import 'package:example/features/book/details/view/book_details_view.dart';
import 'package:example/features/book/edit/view/view.dart';
import 'package:example/features/book/list/data/view_model.dart';
import 'package:example/features/book/list/view/view.dart';

import './view/view.dart';

class BooksModule implements Module {
  final BookValidators bookValidators;
  final BookDB book;

  BooksModule({this.bookValidators, this.book});

  @override
  void register(DependencyContainer container) {
    container.registerSingleton(($) => BookSink($()));
    container.registerSingleton(($) => BooksViewModel($(), $(), $(), $()));
    container.register(($) => AddBookView($(), $()));
    container.register(($) => BookValidatorsHelper($(),$()));
    container.register(($) => bookValidators ?? BookValidators());
    container.registerSingleton(($) => ListBooksViewModel($()));
    container.register(($) => ListBooksView($(),$(),));
    container.register(($) => BookValidatorsView());
    container.register(($) => EditBookView($(), $()));
    container.register(($) => book);
    container.register(($) => BookDetailsView($()));
  }
}
