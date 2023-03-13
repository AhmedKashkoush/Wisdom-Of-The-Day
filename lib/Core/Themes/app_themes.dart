import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Themes/theme_storage.dart';

class AppThemes {
  // static final ThemeData _common = ThemeData(
  //   useMaterial3: true,
  //   primarySwatch: Colors.blue,
  //   splashFactory: InkRipple.splashFactory,
  //   highlightColor: Colors.transparent,
  //   cardTheme: CardTheme(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(25),
  //     ),
  //   ),
  // );
  static ThemeMode? _mode;
  static ThemeMode get mode => _mode ?? ThemeMode.system;
  static final ThemeData light = ThemeData(
    cardColor: Colors.white,
    useMaterial3: true,
    primarySwatch: Colors.blue,
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
    ),
  );
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
    dividerColor: Colors.grey.shade800,
    cardColor: Colors.grey.shade900,
    useMaterial3: true,
    primarySwatch: Colors.blue,
    splashFactory: InkRipple.splashFactory,
    highlightColor: Colors.transparent,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    ),
  );

  static void changeTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
    _mode = mode;
    ThemeStorage.setTheme(mode);
  }
}
