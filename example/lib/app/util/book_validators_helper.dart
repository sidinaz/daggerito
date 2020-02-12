import 'package:example/app/locale/i18n.dart';
import 'package:example/app/ui/book_validators_expandable_item_view.dart';
import 'package:example/app/util/validators_helper.dart';
import 'package:kohana/kohana.dart';

class BookValidatorsHelper {
  final BookValidators validators;
  final Messages messages;

  BookValidatorsHelper(this.validators, this.messages);

  String titleValidatorAsString(String value) {
    final List<TextFieldValidator> _validators = [];
    if (validators.minNCharacters) {
      _validators.add(TextFieldMinLengthValidator(validators.charactersCount,
          errorText:
              messages.validationMinNCharacters(validators.charactersCount)));
    }
    if (validators.titleAlphanumeric) {
      _validators.add(TextFieldAlphanumericValidator(
          errorText: messages.validationAlphanumeric));
    }

    final validator = TextFieldMultiValidator(
      _validators,
    );

    return validator(value);
  }

  Validator titleValidator() {
    final List<Validator> _validators = [];
    if (validators.minNCharacters) {
      _validators.add(MinLengthValidator(validators.charactersCount));
    }

    if (validators.titleAlphanumeric) {
      _validators.add(AlphanumericValidator());
    }

    final validator = MultiValidator(
      _validators,
    );

    return validator;
  }

  String isbnValidatorAsString(String value) =>
      TextFieldValidator(isbnValidator().item1,
          errorText: isbnValidator().item2)(value);

  Tuple2<Validator, String> isbnValidator() => validators.isbn10 &&
          validators.isbn13
      ? Tuple2(ValidatorsHelper.isbnValidator, messages.validationIsbn)
      : (validators.isbn10
          ? Tuple2(ValidatorsHelper.isbn10Validator, messages.validationIsbn10)
          : (validators.isbn13
              ? Tuple2(
                  ValidatorsHelper.isbn13Validator, messages.validationIsbn13)
              : Tuple2(ValidatorsHelper.alwaysValid, null)));

  String descriptionValidatorAsString(String value) =>
      TextFieldValidator(descriptionValidator(),
          errorText: messages.validationRequired,
          ignoreEmptyValues: false)(value);

  Validator descriptionValidator() => validators.descriptionRequired
      ? RequiredValidator()
      : ValidatorsHelper.alwaysValid;
}
