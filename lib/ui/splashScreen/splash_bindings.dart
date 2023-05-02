import 'package:get/get.dart';
import 'package:getx_example/ui/splashScreen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
