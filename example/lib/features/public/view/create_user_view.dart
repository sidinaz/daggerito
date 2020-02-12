import 'package:example/app/locale/i18n.dart';
import 'package:example/features/book/add/view/app_text_field.dart';
import 'package:example/features/public/data/model.dart';
import 'package:example/features/public/data/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class CreateUserView extends BaseView {
  final PublicViewModel model;
  final CreateUserSink sink;

  CreateUserView(this.model, this.sink);

  @override
  Widget buildWidget(BuildContext context) => PlatformScaffold(
    iosContentPadding: true,
        appBar: PlatformAppBar(
          ios: (context) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
          trailingActions: <Widget>[
            buildSaveButton(),
          ],
          title: PlatformText(Messages.current.createUser),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: ListTile(
                title: AppTextField(
                  stream: model.usernameUI,
                  onChanged: sink.addUsername,
                  labelText: Messages.current.username,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildSaveButton() => Observer<bool>(
      stream: model.isValid,
      onSuccess: (_, isValid) => isValid
          ? FlatButton(
              child: Text(Messages.current.createUser),
              onPressed: sink.addSaveUserTap,
            )
          : FlatButton(
              child: Text(Messages.current.createUser),
            ));

  @override
  void componentDidMount() {
    disposeBag.addAll([
      model.userSaved.listen(Navigator.of(context).pop),
    ]);
  }
}
