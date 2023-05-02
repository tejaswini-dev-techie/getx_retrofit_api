// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl = ""}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl = 'https://jsonplaceholder.typicode.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<PostModel>> getPosts(contentType) async {
    ArgumentError.checkNotNull(contentType, 'contentType');
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.request<List<dynamic>>('$baseUrl/posts',
        queryParameters: queryParameters,
        options: Options(
          method: 'GET',
          headers: <String, dynamic>{r'Content-Type': contentType},
          extra: extra,
          contentType: contentType,
        ),
        data: data);
    var value = result.data
        ?.map((dynamic i) => PostModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value!;
  }

  @override
  Future<List<UsersModel>> getUserDetails(contentType) async {
    ArgumentError.checkNotNull(contentType, 'contentType');
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.request<List<dynamic>>('$baseUrl/users',
        queryParameters: queryParameters,
        options: Options(
          method: 'GET',
          headers: <String, dynamic>{r'Content-Type': contentType},
          extra: extra,
          contentType: contentType,
        ),
        data: data);
    var value = result.data
        ?.map((dynamic i) => UsersModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value!;
  }

  @override
  Future<List<CommentsModel>> getCommentFromPostId(postId) async {
    ArgumentError.checkNotNull(postId, 'postId');
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result =
        await _dio.request<List<dynamic>>('$baseUrl/comments?postId=$postId',
            queryParameters: queryParameters,
            options: Options(
              method: 'GET',
              headers: <String, dynamic>{},
              extra: extra,
            ),
            data: data);
    var value = result.data
        ?.map((dynamic i) => CommentsModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value!;
  }
}
