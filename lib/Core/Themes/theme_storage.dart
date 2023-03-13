import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wisdom_of_the_day/Core/Themes/app_themes.dart';

class ThemeStorage {
  static final GetStorage _box = GetStorage();

  static void getTheme() {
    final String? mode = _box.read<String>('theme');
    if (mode == null) return;
    AppThemes.changeTheme(ThemeMode.values.byName(mode));
  }

  static void setTheme(ThemeMode mode) async {
    await _box.write('theme', mode.name);
  }
}
