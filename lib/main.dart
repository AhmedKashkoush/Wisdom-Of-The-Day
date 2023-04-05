import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Locales/app_translations.dart';
import 'package:wisdom_of_the_day/Core/Routes/app_pages.dart';
import 'package:wisdom_of_the_day/Core/Routes/app_routes.dart';
import 'package:wisdom_of_the_day/Core/Themes/app_themes.dart';
import 'package:wisdom_of_the_day/Core/Utils/app_services.dart';

void main() async {
  await AppServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisdom Of The Day',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: AppThemes.mode,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
    );
  }
}
