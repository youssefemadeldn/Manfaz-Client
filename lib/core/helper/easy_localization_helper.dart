import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/core/helper/language_change_notifier.dart';

class EasyLocalizationHelper {
  BuildContext get context =>
      getIt<GlobalKey<NavigatorState>>().currentContext!;

//  getLocale() = getCurrentLocale()
  String getLocale() {
    return EasyLocalization.of(
                getIt<GlobalKey<NavigatorState>>().currentContext!)
            ?.currentLocale
            ?.languageCode ??
        'en';
  }

  String getCurrentLocale() {
    return context.locale.languageCode;
  }
  
  /// Changes the app locale and notifies listeners
  void changeLocale(BuildContext context, Locale locale) {
    context.setLocale(locale);
    LanguageChangeNotifier().notifyLanguageChanged(locale.languageCode);
  }
}
