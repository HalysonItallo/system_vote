import 'package:dio/dio.dart';
import 'package:system_vote/app/interfaces/comment_interface.dart';
import 'package:system_vote/app/models/entities/comment_model.dart';

class CommentRepository implements ICommentRepository {
  final Dio _dio;

  CommentRepository(this._dio);

  @override
  Future<bool> createComment(String idPost, CommentModel data) async {
    final response = await _dio.post<dynamic>("/createComment", data: {
      "idPost": idPost,
      "author": data.author,
      "text": data.text,
    });

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  @override
  Future<List<CommentModel>> getAllComments(String id) async {
    final response = await _dio.get<List<dynamic>>('/getAllComments/$id');

    if (response.statusCode == 200) {
      return response.data!.map((e) => CommentModel.fromJson(e)).toList();
    }

    return [];
  }
}
