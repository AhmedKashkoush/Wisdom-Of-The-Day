import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
