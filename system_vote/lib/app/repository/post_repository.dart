import 'package:dio/dio.dart';
import 'package:system_vote/app/interfaces/post_interface.dart';
import 'package:system_vote/app/models/entities/post_model.dart';
import 'package:system_vote/app/services/shared_local_storage.dart';

class PostRepository implements IPostRepository {
  final Dio _dio;
  final SharedLocalStore _sharedLocalStore;

  PostRepository(this._dio, this._sharedLocalStore);

  @override
  Future<bool> addDislike(String id) async {
    final response = await _dio.get<dynamic>('addDislike/$id');

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> addLike(String id) async {
    final response = await _dio.get<dynamic>('addLike/$id');

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> createPost(PostModel data) async {
    dynamic id = await _sharedLocalStore.get("id");
    final response = await _dio.post<dynamic>("/createPost", data: {
      "idUser": id,
      "author": data.author,
      "text": data.text,
    });

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await _dio.get<List<dynamic>>('/getAllPosts');

    if (response.statusCode == 200) {
      return response.data!.map((e) => PostModel.fromJson(e)).toList();
    }

    return [];
  }

  @override
  Future<List<PostModel>> getMyPosts() async {
    dynamic id = await _sharedLocalStore.get("id");
    final response = await _dio.get<List<dynamic>>('/getMyPosts/$id');

    if (response.statusCode == 200) {
      return response.data!.map((e) => PostModel.fromJson(e)).toList();
    }

    return [];
  }
}
