import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/repository/post_repository.dart';
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

class _PostState extends State<Post> {
  final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
  final PostRepository postRepository = Modular.get<PostRepository>();

  bool _isLiked = false;
  bool _isDisliked = false;

  @override
  Widget build(BuildContext context) {
    void _toggleLike() {
      _isDisliked = false;
      setState(() {
        if (_isLiked) {
          _isLiked = false;
        } else {
          _isLiked = true;
          postRepository.addLike(widget.idPost);
        }
      });
    }

    void _toggleDislike() {
      setState(() {
        _isLiked = false;
        if (_isDisliked) {
          _isDisliked = false;
        } else {
          _isDisliked = true;
          postRepository.addDislike(widget.idPost);
        }
      });
    }

    return SizedBox(
      width: 800,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: systemVoteTheme
                .primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color: _isLiked ? Colors.green : Colors.white,
                        ),
                        tooltip: 'Like',
                        onPressed: () {
                          _toggleLike();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          color: _isDisliked ? Colors.red : Colors.white,
                        ),
                        tooltip: 'Dislike',
                        onPressed: () {
                          _toggleDislike();
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
                              .navigate('/comment/?idPost=${widget.idPost}');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
