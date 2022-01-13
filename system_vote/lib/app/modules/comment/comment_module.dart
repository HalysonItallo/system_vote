import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/modules/comment/widgets/create_comment_page.dart';

import 'comment_page.dart';

class CommentModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
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
  ];
}
