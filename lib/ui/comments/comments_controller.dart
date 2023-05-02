import 'package:get/get.dart';
import 'package:getx_example/core/models/comments_model.dart';
import 'package:getx_example/services/api_services.dart';

class CommentsController extends GetxController {
  final APIServices _apiService = Get.find<APIServices>();
  final int postID = int.parse(Get.arguments[1]);
  final String postTitle = Get.arguments[0];

  List<CommentsModel>? commentsModelResult;
  RxBool isDone = false.obs;

  CommentsController() {
    requestDataApi();
  }

  Future<void> requestDataApi() async {
    commentsModelResult = await _apiService.getComments(postID);
    if (commentsModelResult != null) {
      isDone.toggle();
    }
  }
}
