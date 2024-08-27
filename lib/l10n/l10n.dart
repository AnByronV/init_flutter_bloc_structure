import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class L10n {
  static final all = [
    const Locale('es'),
    const Locale('en'),
    // const Locale('fr'),
    // const Locale('de'),
    // const Locale('it'),
    // const Locale('pt'),
  ];

  static final localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static String getFlag(String languageCode) {
    switch (languageCode) {
      case 'es':
        return '🇪🇸';
      case 'en':
        return '🇬🇧';
      case 'fr':
        return '🇫🇷';
      case 'de':
        return '🇩🇪';
      case 'it':
        return '🇮🇹';
      case 'pt':
        return '🇵🇹';
      default:
        return '🇪🇸';
    }
  }

  static String getLanguage(String languageCode) {
    switch (languageCode) {
      case 'es':
        return 'Español';
      case 'en':
        return 'English';
      case 'fr':
        return 'Francés';
      case 'de':
        return 'Alemán';
      case 'it':
        return 'Italiano';
      case 'pt':
        return 'Português';
      default:
        return 'Español';
    }
  }


}