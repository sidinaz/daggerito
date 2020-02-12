import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/book_validators_expandable_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

// ignore: must_be_immutable
class BookValidatorsView extends BaseView {
  final String title = Messages.current.validators;
  _Fields fields;

  @override
  Widget buildWidget(BuildContext context) => PlatformScaffold(
    iosContentPadding: true,
        appBar: PlatformAppBar(
          title: PlatformText(title),
          trailingActions: <Widget>[
            buildNextButton(),
          ],
        ),
        body: BookTitleValidatorsExpandableItemView(fields.validators),
      );

  Widget buildNextButton() => Observer<BookValidators>(
      stream: fields.validators,
      onSuccess: (_, model) => model.isValid
          ? FlatButton(
              child: Text(Messages.current.next),
              onPressed: () => goNext(model),
            )
          : FlatButton(
              child: Text(Messages.current.next),
            ));

  @override
  void handleManagedFields() {
    fields = managedField(() => _Fields());
  }

  void goNext(BookValidators validators) async {
    final $ = await RoutexNavigator.shared
        .push("/app/books/add", context, {"validators": validators});
    if ($ != null) {
      Navigator.of(context).pop();
    }
  }
}

class _Fields {
  // ignore: close_sinks
  final validators = BehaviorSubject.seeded(BookValidators());
}
