import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Locales/app_translation_keys.dart';
import 'package:wisdom_of_the_day/Core/Themes/app_themes.dart';
import 'package:wisdom_of_the_day/Model/Models/wisdom_model.dart';
import 'package:wisdom_of_the_day/Model/Repositories/wisdom_repository.dart';
import 'package:wisdom_of_the_day/Model/Services/Cache/wisdom_cache.dart';
import 'package:wisdom_of_the_day/Model/Services/Web/wisdom_api.dart';

class HomeController extends GetxController {
  WisdomModel? _wisdom;
  WisdomModel? get wisdom => _wisdom;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;
  String _error = '';
  String get error => _error;

  final WisdomRepositoryImp _api = WisdomRepositoryImp(WisdomApi());

  @override
  void onInit() {
    loadWisdom();
    super.onInit();
  }

  Future<void> loadWisdom() async {
    _isLoading = true;
    update();

    try {
      _wisdom = await _api.getWisdom();
      WisdomCache.saveWisdom(_wisdom!);
      // Get.defaultDialog(title: '_error');
    } on Exception catch (e) {
      _wisdom = WisdomCache.getWisdom();
      if (_wisdom == null) {
        _hasError = true;
        _error = e is SocketException
            ? AppTranslationKeys.checkInternet.tr
            : e.toString().replaceRange(0, 11, '');
      }
    }
    _isLoading = false;
    update();
  }

  void onRefresh() {
    _hasError = false;
    _error = '';
    loadWisdom();
  }

  void showSettings() {
    Get.bottomSheet(
      Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(AppTranslationKeys.account.tr),
              leading: const Icon(Icons.person_outline),
              onTap: () {},
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text(AppTranslationKeys.themes.tr),
              leading: const Icon(Icons.dark_mode_outlined),
              onTap: _showThemes,
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text(AppTranslationKeys.languages.tr),
              leading: const Icon(Icons.translate_outlined),
              onTap: _showLocales,
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text(AppTranslationKeys.logout.tr),
              textColor: Colors.red,
              iconColor: Colors.red,
              leading: const Icon(Icons.logout_outlined),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _showLocales() {
    Get.back();
    final List<String> items = [
      AppTranslationKeys.system,
      'English',
      'العربية'
    ];
    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: ReorderableList(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(index),
                  title: Text(items[index]),
                );
              },
              onReorder: (oldIndex, newIndex) {
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }

  void _showThemes() {
    Get.back();
    Get.bottomSheet(
      StatefulBuilder(builder: (context, setState) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                groupValue: AppThemes.mode,
                value: ThemeMode.system,
                title: const Text('System'),
                onChanged: (mode) {
                  AppThemes.changeTheme(mode!);
                  setState(() {});
                },
              ),
              const Divider(
                thickness: 1,
              ),
              RadioListTile<ThemeMode>(
                groupValue: AppThemes.mode,
                value: ThemeMode.light,
                title: const Text('Light'),
                onChanged: (mode) {
                  AppThemes.changeTheme(mode!);
                  setState(() {});
                },
              ),
              const Divider(
                thickness: 1,
              ),
              RadioListTile<ThemeMode>(
                groupValue: AppThemes.mode,
                value: ThemeMode.dark,
                title: const Text('Dark'),
                onChanged: (mode) {
                  AppThemes.changeTheme(mode!);
                  setState(() {});
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
