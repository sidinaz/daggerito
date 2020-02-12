import 'package:example/app/locale/i18n.dart';
import 'package:example/features/book/add/view/app_text_field.dart';
import 'package:example/features/book/data/model.dart';
import 'package:example/features/book/data/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class AddBookView extends BaseView {
  final BooksViewModel model;
  final BookSink sink;
  final title = Messages.current.addBook;

  _Fields fields;

  AddBookView(this.model, this.sink);

  @override
  Widget buildWidget(BuildContext context) => PlatformScaffold(
        iosContentPadding: true,
        appBar: PlatformAppBar(
          ios: (context) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
          title: PlatformText(title),
          trailingActions: <Widget>[
            buildSaveButton(),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              children: <Widget>[
                AppTextField(
                  stream: model.titleUI,
                  onChanged: sink.addTitle,
                  labelText: Messages.current.title,
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  stream: model.isbnUI,
                  onChanged: sink.addIsbn,
                  labelText: 'Isbn',
                  controller: fields.isbnTextEditingController,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        child: Text("Gen. ISBN 10"),
                        onPressed: generateIsbn,
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Text("Gen. ISBN 13"),
                        onPressed: () => generateIsbn(isbn10: false),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  stream: model.descriptionUI,
                  onChanged: sink.addDescription,
                  labelText: Messages.current.description,
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildSaveButton() => Observer<bool>(
      stream: model.isValid,
      onSuccess: (_, isValid) => isValid
          ? FlatButton(
              child: Text(Messages.current.save),
              onPressed: sink.addBookSaveTap,
            )
          : FlatButton(
              child: Text(Messages.current.save),
            ));

  @override
  void handleManagedFields() {
    final titleTextEditingController = useTextEditingController();
    final isbnTextEditingController = useTextEditingController();
    final descriptionTextEditingController = useTextEditingController();
    fields = managedField(() => _Fields(titleTextEditingController,
        isbnTextEditingController, descriptionTextEditingController));
  }

  @override
  void componentDidMount() {
    disposeBag.addAll([
      model.bookSaved.listen(Navigator.of(context).pop),
    ]);

    if (model.book != null) {
      fields.titleTextEditingController.text = model.book.title;
      fields.isbnTextEditingController.text = model.book.isbn;
      fields.descriptionTextEditingController.text = model.book.description;
    }
  }

  void generateIsbn({bool isbn10 = true}) {
    final value =
        isbn10 ? "ISBN-10: 0-596-52068-9" : "ISBN-13: 978-0-596-52068-7";
    fields.isbnTextEditingController.text = value;
    sink.addIsbn(value);
  }
}

class _Fields {
  final TextEditingController titleTextEditingController;
  final TextEditingController isbnTextEditingController;
  final TextEditingController descriptionTextEditingController;

  _Fields(
    this.titleTextEditingController,
    this.isbnTextEditingController,
    this.descriptionTextEditingController,
  );
}
