import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/repository/post_repository.dart';

import 'my_favorites_page.dart';

class MyFavoriteModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(((i) => PostRepository(i.get(), i.get()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => MyFavoritePage(
        key: UniqueKey(),
      ),
    ),
  ];
}
