import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Locales/app_translation_keys.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          AppTranslationKeys.title: 'Wisdom Of The Day',
          AppTranslationKeys.wisdom: 'Wisdom',
          AppTranslationKeys.account: 'Account',
          AppTranslationKeys.themes: 'Themes',
          AppTranslationKeys.languages: 'Languages',
          AppTranslationKeys.logout: 'Log out',
          AppTranslationKeys.system: 'System',
          AppTranslationKeys.light: 'Light',
          AppTranslationKeys.dark: 'Dark',
          AppTranslationKeys.checkInternet:
              'Error connecting to the server, Check your internet connection or wait until the server responds',
        },
        'ar': {
          AppTranslationKeys.title: 'حكمة اليوم',
          AppTranslationKeys.account: 'الحساب',
          AppTranslationKeys.themes: 'المواضيع',
          AppTranslationKeys.languages: 'اللغات',
          AppTranslationKeys.logout: 'تسجيل الخروج',
          AppTranslationKeys.system: 'النظام',
          AppTranslationKeys.light: 'ساطع',
          AppTranslationKeys.dark: 'مظلم',
          AppTranslationKeys.checkInternet:
              'خطأ في الإتصال بالخادم, تحقق من اتصالك بالإنترنت أو انتظر حتى يستجيب الخادم',
        },
      };
}
