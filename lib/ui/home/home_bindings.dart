import 'package:get/get.dart';
import 'package:getx_example/ui/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
