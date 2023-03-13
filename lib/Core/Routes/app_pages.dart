import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Core/Bindings/home_binding.dart';
import 'package:wisdom_of_the_day/Core/Routes/app_routes.dart';
import 'package:wisdom_of_the_day/View/Screens/home_screen.dart';

class AppPages {
  static const String initialRoute = AppRoutes.home;
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
