import 'package:get/get.dart';
import 'package:getx_example/core/shared/route_constants.dart';

class SplashController extends GetxController {
  SplashController() {
    movePage();
  }

  Future<void> movePage() async {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed(RouteConstants.homeRoute);
    });
  }
}
