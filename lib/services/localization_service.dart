import 'package:firstapp/lang/en_US.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../lang/hi_IN.dart';
import '../lang/ml_IN.dart';
import '../lang/mr_IN.dart';
import '../lang/pa_IN.dart';

class LocalizationService extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['English', 'Hindi', 'Malayalam', 'Marathi', 'Punjabi'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
    Locale('ml', 'IN'),
    Locale('mr', 'IN'),
    Locale('pa', 'IN'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/hi_IN.dart'ar_AE': arAE, // lang/ar_AE.dart
        'hi_IN': hiIN, // lang/hi_IN.dart'ar_AE': arAE, // lang/ar_AE.dart
        'ml_IN': mlIN, // lang/hi_IN.dart'ar_AE': arAE, // lang/ar_AE.dart
        'mr_IN': mrIN, // lang/hi_IN.dart'ar_AE': arAE, // lang/ar_AE.dart
        'pa_IN': paIN, // lang/hi_IN.dart'ar_AE': arAE, // lang/ar_AE.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);

    final box = GetStorage();
    box.write('lng', lang);

    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }

  Locale getCurrentLocale() {
    final box = GetStorage();
    Locale defaultLocale;

    if (box.read('lng') != null) {
      final locale =
          LocalizationService().getLocaleFromLanguage(box.read('lng'));

      defaultLocale = locale;
    } else {
      defaultLocale = Locale(
        'hi',
        'IN',
      );
    }

    return defaultLocale;
  }

  String getCurrentLang() {
    final box = GetStorage();

    return box.read('lng') != null ? box.read('lng') : "English";
  }
}
