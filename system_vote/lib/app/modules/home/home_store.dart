import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:system_vote/app/models/entities/user_model.dart';
import 'package:system_vote/app/repository/user_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final UserRepository userRepository = Modular.get<UserRepository>();

  @observable
  bool validity = true;

  Future<bool> getLogin(String email, String password) async {
    UserModel userModel = await userRepository.login(email, password);

    if (userModel.email == '' && userModel.password == '') {
      validity = false;
    } else {
      validity = true;
      return true;
    }

    return false;
  }
}
