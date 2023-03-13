import 'package:get_storage/get_storage.dart';
import 'package:wisdom_of_the_day/Core/Themes/theme_storage.dart';

class AppServices {
  static Future<void> init() async {
    await GetStorage.init();
    ThemeStorage.getTheme();
  }
}
