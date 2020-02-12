import 'package:example/app/database/database.dart';
import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/layout_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

import '../data/view_model.dart';

// ignore: must_be_immutable
class ListBooksView extends BaseView {
  final ListBooksViewModel model;
  final String title = Messages.current.listBooks;
  final LayoutManager layout;

  ListBooksView(this.model, this.layout);

  Widget buildAddButton(BuildContext context, [double size]) => Observer(
    stream: model().items.map(($) => $.length > 0),
    onSuccess: (context, show) => Offstage(
      offstage: !show,
      child: PlatformIconButton(
        icon: Icon(
          context.platformIcons.add,
          size: size,
        ),
        onPressed: addNewBook,
      ),
    ) ,
  );

  Widget buildAddButtonCenter(BuildContext context) => Center(
    child: GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            context.platformIcons.add,
            size: 80,
          ),
          Text(Messages.current.addBook),
          SizedBox(height: 50,)
        ],

      ),
      onTap: addNewBook,
    ),
  );

  Widget buildEditButton(BuildContext context, BookDB book) =>
      PlatformIconButton(
        icon: Icon(
          Icons.edit,
        ),
        onPressed: () => editBook(book),
      );

  Widget buildDeleteButton(BuildContext context, BookDB book) =>
      PlatformIconButton(
        icon: Icon(
          Icons.delete,
        ),
        onPressed: () => _showPopupSheet(book),
      );

  @override
  Widget buildWidget(BuildContext context) => OrientationLayout(
        portrait: (ctx) => PlatformScaffold(
          appBar: buildPlatformAppBar(ctx),
          body: buildBodyContent(),
        ),
        landscape: (_) => PlatformScaffold(
          body: buildBodyContent(),
        ),
      );

  Widget buildBodyContent() => Observer<List<BookDB>>(
        stream: model().items,
        onSuccess: (context, items) => items.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) => Card(
                    child: ListTile(
                  onTap: () => bookDetails(items[index]),
                  title: Text(items[index].title),
                  subtitle: Text(items[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildEditButton(context, items[index]),
                      buildDeleteButton(context, items[index]),
                    ],
                  ),
                )),
                itemCount: items.length,
              )
            : buildAddButtonCenter(context),
      );

  PlatformAppBar buildPlatformAppBar(BuildContext context) => PlatformAppBar(
        ios: (context) => CupertinoNavigationBarData(
          transitionBetweenRoutes: false,
        ),
        trailingActions: <Widget>[
          buildAddButton(context),
        ],
        leading: buildOffstage(context),
        title: PlatformText(title),
      );

  Widget buildOffstage(BuildContext context) => layout.mainLayout == 1
      ? PlatformIconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
//            color: Theme.of(context).primaryColor,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        )
      : null;

  void addNewBook() {
    RoutexNavigator.shared.push("/app/books/", context);
  }

  void editBook(BookDB book) {
    RoutexNavigator.shared.push("/app/books/edit", context, {"book": book});
  }

  void deleteBook(BookDB book) {
    disposeBag.add(this.model.deleteBookById(book.id).listen(($) {
      Navigator.pop(context);
    }));
  }

  void _showPopupSheet(BookDB model) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: PlatformText(Messages.current.delete),
        content: PlatformText(model.title),
        actions: <Widget>[
          PlatformDialogAction(
            android: (_) => MaterialDialogActionData(),
            ios: (_) => CupertinoDialogActionData(),
            child: PlatformText(Messages.current.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          PlatformDialogAction(
            child: PlatformText(Messages.current.ok),
            onPressed: () => deleteBook(model),
          ),
        ],
      ),
    );
  }

  void bookDetails(BookDB book) {
    RoutexNavigator.shared.push("/app/books/details", context, {"book": book});
  }
}
