import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Controller/home_controller.dart';
import 'package:wisdom_of_the_day/Core/Locales/app_translation_keys.dart';
import 'package:wisdom_of_the_day/View/Widgets/error_card.dart';
import 'package:wisdom_of_the_day/View/Widgets/loading_indicator.dart';
import 'package:wisdom_of_the_day/View/Widgets/wisdom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const List<Color> _lightColors = [Colors.blue, Colors.purple];
  static final List<Color> _darkColors = [
    Colors.blue.shade900,
    Colors.purple.shade900,
    Colors.indigo.shade900,
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppTranslationKeys.title.tr),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: controller.showSettings,
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark ? _darkColors : _lightColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                transitionBuilder: (child, a) => SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(0, -0.25), end: Offset.zero)
                      .animate(a),
                  child: FadeTransition(
                    opacity: a,
                    child: ScaleTransition(
                      scale: a,
                      child: child,
                    ),
                  ),
                ),
                child: controller.isLoading
                    ? const Card(
                        key: ValueKey('loading'),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: LoadingIndicator(),
                        ),
                      )
                    : controller.hasError
                        ? ErrorCard(
                            key: const ValueKey('error'),
                            message: controller.error,
                            onRefresh: controller.onRefresh,
                          )
                        : WisdomCard(
                            key: const ValueKey('data'),
                            wisdom: controller.wisdom!,
                          ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
