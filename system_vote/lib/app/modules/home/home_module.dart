import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/modules/home/pages/comment/create_comment_page.dart';
import 'package:system_vote/app/modules/home/pages/feed/feed_page.dart';
import 'package:system_vote/app/modules/home/pages/feed/feed_store.dart';
import 'package:system_vote/app/modules/home/pages/favorites/my_favorites_page.dart';
import 'package:system_vote/app/modules/home/pages/my_topics/my_topics_page.dart';
import 'package:system_vote/app/modules/home/pages/singup_page.dart';
import 'package:system_vote/app/widgets/post/post_store.dart';
import '../home/home_store.dart';
import 'pages/create_post/create_post_page.dart';
import 'pages/comment/comment_page.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore()),
    Bind((i) => FeedStore()),
    Bind((i) => PostStore()),
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
      '/new-post',
      child: (_, args) => CreatePost(
        key: UniqueKey(),
      ),
    ),
    ChildRoute(
      '/comment',
      child: (_, args) => CommentPage(
        key: UniqueKey(),
        idPost: args.queryParams['idPost'],
      ),
    ),
    ChildRoute(
      '/create-comment',
      child: (_, args) => CreateCommentPage(
        key: UniqueKey(),
        idPost: args.queryParams['idPost'],
      ),
    ),
    ChildRoute(
      '/my-topics',
      child: (_, args) => MyTopicsPage(
        key: UniqueKey(),
      ),
    ),
    ChildRoute(
      '/my-favorites',
      child: (_, args) => MyFavoritePage(
        key: UniqueKey(),
      ),
    ),
    ChildRoute(
      '/singup',
      child: (_, args) => SingUpPage(
        key: UniqueKey(),
      ),
    ),
    ChildRoute(
      '/feed',
      child: (_, args) => FeedPage(
        key: UniqueKey(),
      ),
    ),
  ];
}
