import 'package:get/get.dart';
import 'package:getx_example/ui/posts/posts_controller.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostsController());
  }
}
