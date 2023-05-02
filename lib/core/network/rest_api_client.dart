import 'package:dio/dio.dart' hide Headers;
import 'package:getx_example/core/models/UsersModel.dart';
import 'package:getx_example/core/models/post_model.dart';
import 'package:getx_example/core/models/comments_model.dart';
import 'package:getx_example/core/network/api_const.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseURL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiConstants.postURL)
  Future<List<PostModel>> getPosts(@Header("Content-Type") String contentType);

  @GET(ApiConstants.userDetailsURL)
  Future<List<UsersModel>> getUserDetails(
      @Header("Content-Type") String contentType);

  @GET(ApiConstants.commentsURL)
  Future<List<CommentsModel>> getCommentFromPostId(@Path("id") int postId);
}
