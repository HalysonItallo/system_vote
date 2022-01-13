import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'my_favorites_page.dart';

class MyFavoriteModule extends Module {
  @override
  final List<Bind> binds = [];

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
