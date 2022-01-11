import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  bool isLogged = true;

  Future<void> getLogin(String email, String password) async {
    var dio = Dio();
    var sessionManager = SessionManager();

    await dio.post('http://10.0.2.2:3333/login', data: {
      'email': email,
      'password': password,
    }).then((value) async => {
          if (value.data['email'] == '' || value.data['password'] == '')
            {
              isLogged = false,
            }
          else
            {
              await sessionManager.set('id', value.data['id']),
              await sessionManager.set('name', value.data['name']),
              isLogged = true,
              Modular.to.navigate('/feed'),
            }
        });
  }
}
