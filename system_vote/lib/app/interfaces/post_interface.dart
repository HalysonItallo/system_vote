import 'package:system_vote/app/models/entities/post_model.dart';

abstract class IPostRepository {
  Future<bool> createPost(PostModel data);
  Future<List<PostModel>> getAllPosts();
  Future<List<PostModel>> getMyPosts();
  Future<bool> addLike(String id);
  Future<bool> addDislike(String id);
}
