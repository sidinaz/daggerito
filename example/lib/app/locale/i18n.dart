import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
class Messages implements WidgetsLocalizations {
  const Messages();

  static Messages current;

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static Messages of(BuildContext context) =>
      Localizations.of<Messages>(context, Messages);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get about => "About";

  String get all => "All";

  String get chooseTheme => "Choose Theme";

  String get clearLanguage => "Clear language";

  String get closed => "Closed";

  String get created => "Created";

  String get debug => "Debug";

  String get email => "Email";

  String get empty => "Empty";

  String get english => "English";

  String get fullName => "Full name";

  String get issues => "Issues";

  String get language => "Language";

  String get license => "License";

  String get loadingMoreData => "Loading more data...";

  String get login => "Login";

  String get logout => "Logout";

  String get myRepos => "My repos";

  String get more => "More";

  String get news => "News";

  String get next => "Next";

  String get noMoreData => "No more data";

  String get notifications => "Notifications";

  String get open => "Open";

  String get openInBrowser => "Open in browser";

  String get private => "Private";

  String get profile => "Profile";

  String get public => "Public";

  String get pushed => "Pushed";

  String get saveChanges => "Save changes";

  String get selectALanguage => "Select a language";

  String get settings => "Settings";

  String get share => "Share";

  String get skip => "Skip";

  String get state => "State";

  String get save => "Save";

  String get systemDefault => "System Default";

  String get tapToRetry => "TAP TO RETRY";

  String get thisFieldCanNotBeEmpty => "This field cannot be empty";

  String get trending => "Trending";

  String get type => "Type";

  String get title => "Title";

  String get description => "Description";

  String get listBooks => "All books";

  String get listUsers => "All users";

  String get addBook => "Add book";

  String get editBook => "Edit book";

  String get bookDetails => "Book details";

  String get updated => "Updated";

  String get users => "Users";

  String get delete => "Delete";

  String get deleteAll => "Delete all";

  String get deleteFromSelection => "Delete from selection";

  String get cancel => "Cancel";

  String get ok => "Ok";

  String get validationIsbn10 => "The value is not valid ISBN 10";

  String get validationIsbn10Label => "Enter valid ISBN 10";

  String get validationIsbn13 => "The value is not valid ISBN 13";

  String get validationIsbn13Label => "Enter valid ISBN 13";

  String get validationIsbn => "The value is not valid ISBN";

  String get validationAlphanumericLabel => "Alphanumeric characters only";

  String get validationAlphanumeric =>
      "Please input alphanumeric characters only";

  String get validationRequired => "Field is required";

  String get validationDescriptionLabel => "Description is required";

  String get bookValidators => "Book validators";

  String get bookValidatorsSubtitle => "Choose validators";

  String get validators => "Validators";

  String get setLayout => "Set layout";

  String get setLayoutSubtitle => "Set layout of your app";

  String get setTheme => "Set look";

  String get setThemeSubtitle => "Choose app theme";

  String get setPlatform => "Set platform";

  String get setPlatformSubtitle => "For testing";

  String get setLocale => "Set locale";

  String get setLocaleSubtitle => "Use default or custom locale";

  String get username => "Username";

  String get createUser => "Create user";

  String get numberOfInitializations => "Number of initializations:";

  String get userIsMissing => "User is missing";

  String validationMinNCharacters(int min) => "$min characters minimum";

  String createdAt(String dateTime) => "Created at ${dateTime}";

  String googlePlayAppUrl(String packageName) =>
      "https://play.google.com/store/apps/details?id=$packageName";

  String pushedAt(String dateTime) => "Pushed at ${dateTime}";

  String updatedAt(String dateTime) => "Updated at ${dateTime}";
}

class $en extends Messages {
  const $en();
}

//class $zh_CN extends S {
//
//}

class $bs extends Messages {
  const $bs();

  String get trending => "Aktualno";

  String get repositories => "Repozitoriji";

  String get users => "Korisnici";

  String get search => "Pretraga";

  String get saveChanges => "Spasi promjene";

  String get searchHistory => "Historija pretraga";

  String get myRepos => "Moji repozitoriji";

  String get more => "Više";

  String get settings => "Postavke";

  String get keywords => "Kjučne riječi";

  String get manageYourSearchingHistory => "Uredi historiju pretraga";

  String get about => "O aplikaciji";

  String get logout => "Odjava";

  String get starredRepos => "Omiljeni";

  String get issues => "Pitanja";

  String get delete => "Izbriši";

  String get deleteAll => "Izbriši sve";

  String get deleteFromSelection => "Izbriši odabrane";

  String get cancel => "Odustani";

  String get validationIsbn10 => "Nije validna ISBN 10 vrijednost";

  String get validationIsbn13 => "Nije validna ISBN 13 vrijednost";

  String get validationIsbn => "Nije validna ISBN vrijednost";

  String get validationAlphanumeric => "Unesite samo alfanumeričke karaktere";

  String get validationAlphanumericLabel => "Alfanumerički karakteri samo";

  String validationMinNCharacters(int min) => "$min karaktera minimalno";

  String get validationRequired => "Polje je obavezno";

  String get validationIsbn10Label => "Unesite validan ISBN 10";

  String get validationIsbn13Label => "Unesite validan ISBN 13";

  String get validationDescriptionLabel => "Opis je obavezan";

  String get bookValidators => "Validatori knjige";

  String get bookValidatorsSubtitle => "Odaberite validacije";

  String get next => "Dalje";

  String get save => "Spasi";

  String get title => "Naslov";

  String get description => "Opis";

  String get listBooks => "Sve knjige";

  String get listUsers => "Svi korisnici";

  String get addBook => "Dodaj knjigu";

  String get editBook => "Uredi knjigu";

  String get bookDetails => "Detaljno o knjizi";

  String get validators => "Validatori";

  String get setLayout => "Postavi layout";

  String get setLayoutSubtitle => "Postavite layout vaše aplikacije";

  String get setTheme => "Postavi izgled";

  String get setThemeSubtitle => "Izaberi temu";

  String get setPlatform => "Postavi platformu";

  String get setPlatformSubtitle => "Za testiranje";

  String get setLocale => "Postavi jezik";

  String get setLocaleSubtitle => "Izaberite lokalizaciju";

  String get username => "korisnik";

  String get createUser => "Kreiraj korisnika";

  String get numberOfInitializations => "Broj inicijalizacija:";

}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<Messages> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("bs", ""),
    ];
  }

  LocaleListResolutionCallback listResolution(
      {Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution(
      {Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<Messages> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          Messages.current = const $en();
          return SynchronousFuture<Messages>(Messages.current);
        case "bs":
          Messages.current = const $bs();
          return SynchronousFuture<Messages>(Messages.current);
        default:
        // NO-OP.
      }
    }
    Messages.current = const Messages();
    return SynchronousFuture<Messages>(Messages.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty
        ? l.languageCode
        : l.toString();
