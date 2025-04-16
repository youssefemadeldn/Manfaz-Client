import 'dart:async';

/// A simple notifier for language changes in the app
class LanguageChangeNotifier {
  static final LanguageChangeNotifier _instance = LanguageChangeNotifier._internal();
  
  factory LanguageChangeNotifier() => _instance;
  
  LanguageChangeNotifier._internal();
  
  final _controller = StreamController<String>.broadcast();
  
  /// Stream that emits when language changes
  Stream<String> get onLanguageChanged => _controller.stream;
  
  /// Notify listeners that language has changed
  void notifyLanguageChanged(String languageCode) {
    _controller.add(languageCode);
  }
  
  void dispose() {
    _controller.close();
  }
}
