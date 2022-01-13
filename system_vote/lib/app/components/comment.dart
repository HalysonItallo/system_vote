import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/shared/themes/theme.dart';

class Comment extends StatefulWidget {
  final String text;

  final String author;

  const Comment({
    Key? key,
    required this.text,
    required this.author,
  }) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
