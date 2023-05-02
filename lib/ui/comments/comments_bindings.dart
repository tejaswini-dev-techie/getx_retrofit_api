import 'package:get/get.dart';
import 'package:getx_example/ui/comments/comments_controller.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommentsController());
  }
}
