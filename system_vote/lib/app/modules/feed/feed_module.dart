import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/modules/feed/widgets/create_post_page.dart';

import '../../modules/feed/feed_store.dart';
import 'feed_page.dart';

class FeedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FeedStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => FeedPage(
        key: UniqueKey(),
      ),
    ),
    ChildRoute(
      '/new-post',
      child: (_, args) => CreatePost(
        key: UniqueKey(),
      ),
    ),
  ];
}
