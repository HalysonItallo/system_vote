import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/modules/home/widgets/singup_page.dart';
import 'package:system_vote/app/repository/user_repository.dart';

import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore()),
    Bind(
      (i) => UserRepository(i.get()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(
        key: UniqueKey(),
      ),
    ),
    ChildRoute(
      '/singup',
      child: (_, args) => SingUpPage(
        key: UniqueKey(),
      ),
    )
  ];
}
