import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/repository/post_repository.dart';

import 'my_topics_page.dart';

class MyTopicsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => PostRepository(i.get(), i.get()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => MyTopicsPage(
        key: UniqueKey(),
      ),
    ),
  ];
}
