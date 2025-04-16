import 'dart:async';
import 'package:manfaz/core/helper/easy_localization_helper.dart';
import 'package:manfaz/core/helper/language_change_notifier.dart';
import 'package:manfaz/core/network/api_manager.dart';
import 'package:manfaz/core/di/di.dart';

/// Base class for all remote data sources
/// Handles language changes automatically
abstract class BaseRemoteDataSource {
  final ApiManager apiManager = getIt<ApiManager>();
  final EasyLocalizationHelper _localizationHelper = EasyLocalizationHelper();
  StreamSubscription? _languageChangeSubscription;
  
  BaseRemoteDataSource() {
    // Listen for language changes
    _languageChangeSubscription = LanguageChangeNotifier()
        .onLanguageChanged
        .listen((_) => onLanguageChanged());
  }
  
  /// Get the current language code
  String get currentLanguage => _localizationHelper.getCurrentLocale();
  
  /// Called when the language changes
  /// Override this method to refresh data when needed
  void onLanguageChanged() {
    // Default implementation does nothing
    // Subclasses can override to refresh data
  }
  
  /// Dispose resources
  void dispose() {
    _languageChangeSubscription?.cancel();
    _languageChangeSubscription = null;
  }
}
