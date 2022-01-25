import 'package:system_vote/app/models/entities/comment_model.dart';

abstract class ICommentRepository {
  Future<List<CommentModel>> getAllComments(String id);
  Future<bool> createComment(String id, CommentModel data);
}
