import 'package:flutter/foundation.dart';

/// Manages application locale state
class LocaleProvider extends ChangeNotifier {
  String _currentLocale = 'ar';

  String get currentLocale => _currentLocale;

  bool get isArabic => _currentLocale == 'ar';

  void setLocale(String locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      notifyListeners();
    }
  }

  void toggleLanguage() {
    _currentLocale = _currentLocale == 'ar' ? 'en' : 'ar';
    notifyListeners();
  }
}
