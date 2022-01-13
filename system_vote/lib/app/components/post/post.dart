import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/components/post/post_store.dart';

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
    return SizedBox(
      width: 800,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(
                255, 72, 147, 1), //new Color.fromRGBO(255, 0, 0, 0.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Autor: ${widget.author}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                          icon: const Icon(
                            Icons.comment,
                            color: Colors.white,
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
