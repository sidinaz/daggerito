import 'package:example/app/locale/i18n.dart';
import 'package:example/features/book/add/view/app_text_field.dart';
import 'package:example/features/book/add/view/view.dart';
import 'package:example/features/book/data/model.dart';
import 'package:example/features/book/data/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class EditBookView extends AddBookView {
  final title = Messages.current.editBook;

  EditBookView(BooksViewModel model, BookSink sink) : super(model, sink);

  @override
  Widget buildWidget(BuildContext context) => PlatformScaffold(
        iosContentPadding: true,
        appBar: PlatformAppBar(
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
                  controller: fields.titleTextEditingController,
                  stream: model.titleUI,
                  onChanged: sink.addTitle,
                  labelText: Messages.current.title,
                ),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  controller: fields.isbnTextEditingController,
                  stream: model.isbnUI,
                  onChanged: sink.addIsbn,
                  labelText: 'Isbn',
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
                  controller: fields.descriptionTextEditingController,
                  stream: model.descriptionUI,
                  onChanged: sink.addDescription,
                  labelText: Messages.current.description,
                ),
              ],
            ),
          ),
        ),
      );
}


