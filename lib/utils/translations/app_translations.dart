import 'ar/ar_translations.dart';
import 'en/en_translations.dart';

class AppTranslation {
  Map<String, Map<String, String>> get keys => {
        'ar': arTranslation,
        'en': enTranslation,
      };
}
