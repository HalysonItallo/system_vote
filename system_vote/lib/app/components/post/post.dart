import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/components/post/post_store.dart';
import 'package:system_vote/shared/themes/theme.dart';

class Post extends StatefulWidget {
  final String text;

  final String author;

  final bool isMoreLikded;

  final String idPost;

  const Post({
    Key? key,
    required this.text,
    required this.isMoreLikded,
    required this.author,
    required this.idPost,
  }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends ModularState<Post, PostStore> {
  @override
  Widget build(BuildContext context) {
    final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
    return SizedBox(
      width: 800,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: systemVoteTheme.black, //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.star,
                        color: widget.isMoreLikded
                            ? Colors.yellow
                            : Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: Text(
                      widget.text,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: systemVoteTheme.white,
                      ),
                    ),
                  ),
                  Text(
                    'Autor: ${widget.author}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: systemVoteTheme.white,
                    ),
                  ),
                  Observer(builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: store.isLiked ? Colors.green : Colors.white,
                          ),
                          tooltip: 'Like',
                          onPressed: () {
                            store.addLike(widget.idPost);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: store.isDisliked ? Colors.red : Colors.white,
                          ),
                          tooltip: 'Dislike',
                          onPressed: () {
                            store.addDislike(widget.idPost);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.comment,
                            color: systemVoteTheme.white,
                          ),
                          tooltip: 'Comentário',
                          onPressed: () {
                            Modular.to
                                .navigate('/comment?idPost=${widget.idPost}');
                          },
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
