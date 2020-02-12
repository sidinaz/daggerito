import 'package:example/features/book/add/view/view.dart';
import 'package:example/features/book/details/view/book_details_view.dart';
import 'package:example/features/book/edit/view/view.dart';
import 'package:example/features/book/list/view/view.dart';
import 'package:flutter/material.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';
import './view/view.dart';

class BooksController extends BaseController {
  @override
  void bindRouter(Router router) {
    router.route("/books/").handler(mainHandler);
    router.route("/books/list/").handler(listBooksHandler);
    router.route("/books/add/").handler(addBookHandler);
    router.route("/books/edit").handler(editBookHandler);
    router.route("/books/details").handler(bookDetailsHandler);
  }

  WidgetBuilder mainHandler(RoutingContext context) =>
      (_) => context<BookValidatorsView>();

  WidgetBuilder addBookHandler(RoutingContext context) =>
          (_) => context<AddBookView>();

  WidgetBuilder listBooksHandler(RoutingContext context) =>
          (_) => context<ListBooksView>();

  WidgetBuilder editBookHandler(RoutingContext context) =>
          (_) => context<EditBookView>();

  WidgetBuilder bookDetailsHandler(RoutingContext context) =>
          (_) => context<BookDetailsView>();
}