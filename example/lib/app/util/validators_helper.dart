import 'package:kohana/kohana.dart';

class ValidatorsHelper {
  static const isbn10Pattern =
      "^(?:ISBN(?:-10)?:? )?(?=[0-9X]{10}\$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}\$)[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]\$";
  static const isbn13Pattern =
      "^(?:ISBN(?:-13)?:? )?(?=[0-9]{13}\$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}\$)97[89][- ]?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9]\$";
  static const isbnPattern =
      "^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}\$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}\$|97[89][0-9]{10}\$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}\$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]\$";

  static Validator get isbn10Validator => PatternValidator(isbn10Pattern);

  static Validator get isbn13Validator => PatternValidator(isbn13Pattern);

  static Validator get isbnValidator => PatternValidator(isbnPattern);

  static Validator get alwaysValid => AlwaysValidValidator();
}
