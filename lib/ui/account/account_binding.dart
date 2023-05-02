import 'package:get/get.dart';
import 'package:getx_example/ui/account/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AccountController());
  }
}
