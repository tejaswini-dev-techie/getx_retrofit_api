import 'package:get/get.dart';
import 'package:getx_example/ui/user/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
