import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manfaz/core/di/di.dart';

class EasyLocalizationHelper {
  BuildContext get context =>
      getIt<GlobalKey<NavigatorState>>().currentContext!;

  static String getLocale() {
    return EasyLocalization.of(
                getIt<GlobalKey<NavigatorState>>().currentContext!)
            ?.currentLocale
            ?.languageCode ??
        'en';
  }

  String getCurrentLocale() {
    return context.locale.languageCode;
  }
}
