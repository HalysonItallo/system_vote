import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/modules/comment/comment_module.dart';
import 'package:system_vote/app/modules/favorites/my_favorites_module.dart';
import 'package:system_vote/app/modules/feed/feed_module.dart';
import 'package:system_vote/app/modules/my_topics/my_topics_module.dart';
import 'package:system_vote/app/modules/singup_page/singup_module.dart';
import 'package:system_vote/app/services/shared_local_storage.dart';

import '../shared/themes/theme.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SharedLocalStore()),
    Bind.singleton((i) => SystemVoteTheme()),
    Bind.singleton(
      (i) => Dio(
        BaseOptions(
          baseUrl: 'http://10.0.2.2:3333/',
          contentType: 'application/json',
        ),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
    ),
    ModuleRoute(
      '/comment',
      module: CommentModule(),
    ),
    ModuleRoute(
      '/my-topics',
      module: MyTopicsModule(),
    ),
    ModuleRoute(
      '/my-favorites',
      module: MyFavoriteModule(),
    ),
    ModuleRoute(
      '/singup',
      module: SingUpModule(),
    ),
    ModuleRoute(
      '/feed',
      module: FeedModule(),
    ),
  ];
}
