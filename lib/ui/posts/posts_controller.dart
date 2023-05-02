import 'package:get/get.dart';
import 'package:getx_example/core/models/post_model.dart';
import 'package:getx_example/services/api_services.dart';

class PostsController extends GetxController {
  final APIServices _apiService = Get.find<APIServices>();

  List<PostModel>? postModelResponse = [];
  RxBool isDone = false.obs;

  PostsController() {
    requestDataApi();
  }

  Future<void> requestDataApi() async {
    postModelResponse = await _apiService.getNewPosts();
    if (postModelResponse != null) {
      isDone.toggle();
    }
  }
}
