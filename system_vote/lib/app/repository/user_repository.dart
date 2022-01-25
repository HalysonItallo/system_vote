import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/interfaces/user_interface.dart';
import 'package:system_vote/app/models/entities/user_model.dart';
import 'package:system_vote/app/services/shared_local_storage.dart';

class UserRepository implements IUserRepository {
  final Dio _dio;
  final SharedLocalStore _sharedLocalStore = Modular.get<SharedLocalStore>();

  UserRepository(this._dio);

  @override
  Future<bool> createUser(UserModel data) async {
    final response =
        await _dio.post<dynamic>('/createUser', data: data.toJson());
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _dio.post<dynamic>('/login', data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      if (response.data["email"] != "" && response.data["password"] != "") {
        _sharedLocalStore.put("id", response.data["id"]);
        return UserModel.fromJson(response.data);
      }
    }
    return UserModel.fromJson({
      "id": "",
      "name": "",
      "email": "",
      "password": "",
    });
  }
}
