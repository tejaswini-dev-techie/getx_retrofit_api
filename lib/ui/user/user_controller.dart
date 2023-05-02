import 'package:get/get.dart';
import 'package:getx_example/core/models/UsersModel.dart';
import 'package:getx_example/services/api_services.dart';

class UserController extends GetxController {
  final APIServices _apiService = Get.find<APIServices>();
  RxBool isDone = false.obs;

  List<UsersModel>? userDetailsResult = [];

  UserController() {
    requestDataApi();
  }

  Future<void> requestDataApi() async {
    userDetailsResult = await _apiService.getUserDetailedList();
    if (userDetailsResult != null) {
      isDone.toggle();
    }
  }
}
