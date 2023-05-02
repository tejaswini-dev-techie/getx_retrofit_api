import 'package:dio/dio.dart';
import 'package:getx_example/core/models/UsersModel.dart';
import 'package:getx_example/core/models/comments_model.dart';
import 'package:getx_example/core/models/post_model.dart';
import 'package:getx_example/core/network/rest_api_client.dart';

class APIServices {
  late Dio _dio; /* Http client */
  late ApiClient _restClient; /* Instance */

  APIServices() {
    _dio = Dio();
    _restClient = ApiClient(_dio);
  }

  /*Get method*/
  /*Fetch list of Posts*/
  Future<List<PostModel>?> getNewPosts() async {
    try {
      List<PostModel> response = await _restClient.getPosts("application/json");
      if (response != null) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  /* Get Comments from postID */
  Future<List<CommentsModel>?> getComments(int postID) async {
    try {
      List<CommentsModel> response =
          await _restClient.getCommentFromPostId(postID);
      if (response != null) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  /*Get User Details*/
  Future<List<UsersModel>?> getUserDetailedList() async {
    try {
      List<UsersModel> response =
          await _restClient.getUserDetails("application/json");
      if (response != null) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
