import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  /*Updates Selected Tab Index*/
  onTabTapped(int index) {
    selectedIndex.value = index;
  }
}
