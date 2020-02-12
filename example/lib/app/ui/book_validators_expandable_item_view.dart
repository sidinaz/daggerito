import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/settings_expandable_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:routex/routex.dart';
import 'package:rxdart/rxdart.dart';

// ignore: must_be_immutable
class BookTitleValidatorsExpandableItemView
    extends SettingExpandableItemView<BookValidators> {
  double get maxHeight => fields.expanded ? 440 : 95;

  get title => Messages.current.bookValidators;

  get subtitle => Messages.current.bookValidatorsSubtitle;

  BookTitleValidatorsExpandableItemView(BehaviorSubject<BookValidators> model)
      : super(model, isInitiallyExpanded: true);

  @override
  Widget buildContent() => Observer<BookValidators>(
        stream: asStream(),
        onSuccess: (context, model) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CheckboxListTile(
              title: Text(Messages.current.validationMinNCharacters(model.charactersCount)),
              value: model.minNCharacters,
              onChanged: setMinNCharacters,
            ),
            PlatformSlider(
              value: model.charactersCount.toDouble(),
              min: 3,
              max: 10,
              onChanged: model.minNCharacters ? setCharactersCount : null,
            ),
            CheckboxListTile(
              title: Text(Messages.current.validationAlphanumericLabel),
              value: model.titleAlphanumeric,
              onChanged: setAlphanumeric,
            ),
            CheckboxListTile(
              title: Text(Messages.current.validationIsbn10Label),
              value: model.isbn10,
              onChanged: setIsbn10Validator,
            ),
            CheckboxListTile(
              title: Text(Messages.current.validationIsbn13Label),
              value: model.isbn13,
              onChanged: setIsbn13Validator,
            ),
            CheckboxListTile(
              title: Text(Messages.current.validationDescriptionLabel),
              value: model.descriptionRequired,
              onChanged: setDescriptionRequired,
            ),
          ],
        ),
      );

  void setMinNCharacters(bool value) {
    final model = fields.modelValue;
    model.minNCharacters = value;
    push(model);
  }

  void setIsbn10Validator(bool value) {
    final model = fields.modelValue;
    model.isbn10 = value;
    push(model);
  }

  void setIsbn13Validator(bool value) {
    final model = fields.modelValue;
    model.isbn13 = value;
    push(model);
  }

  void setDescriptionRequired(bool value) {
    final model = fields.modelValue;
    model.descriptionRequired = value;
    push(model);
  }

  void setCharactersCount(double value) {
    final model = fields.modelValue;
    model.charactersCount = value.toInt();
    push(model);
  }

  void setAlphanumeric(bool value) {
    final model = fields.modelValue;
    model.titleAlphanumeric = value;
    push(model);
  }
}

class BookValidators {
  bool minNCharacters = true;
  bool titleAlphanumeric = false;
  int charactersCount = 5;
  bool isbn10 = false;
  bool isbn13 = false;
  bool descriptionRequired = false;

  bool get isValid => (minNCharacters || titleAlphanumeric || isbn10 || isbn13 || descriptionRequired);
}
