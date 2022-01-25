import 'package:system_vote/app/models/entities/user_model.dart';

abstract class IUserRepository {
  Future<bool> createUser(UserModel data);
  Future<UserModel> login(String email, String password);
}
