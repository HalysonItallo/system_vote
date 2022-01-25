import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/modules/comment/comment_page.dart';
import 'package:system_vote/app/modules/comment/widgets/create_comment_page.dart';
import 'package:system_vote/app/repository/comment_repository.dart';

class CommentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(((i) => CommentRepository(i.get()))),
  ];

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
