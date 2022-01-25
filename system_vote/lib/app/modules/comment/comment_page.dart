import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/components/comment.dart';
import 'package:system_vote/app/repository/comment_repository.dart';
import 'package:system_vote/shared/themes/theme.dart';

class CommentPage extends StatefulWidget {
  final String? idPost;
  const CommentPage({
    Key? key,
    this.idPost,
  }) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final CommentRepository commentRepository = Modular.get<CommentRepository>();

  @override
  Widget build(BuildContext context) {
    final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
    return Scaffold(
      backgroundColor: systemVoteTheme.black,
      appBar: AppBar(
        title: const Text('Comentários'),
        titleTextStyle: TextStyle(
          color: systemVoteTheme.white,
          fontSize: 20,
        ),
        backgroundColor: systemVoteTheme.primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              Modular.to.navigate('/feed');
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: commentRepository.getAllComments(widget.idPost!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          bool emptyData = snapshot.data.toString().compareTo("[]") == 0;

          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.active:

            case ConnectionState.waiting:
              return const SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasData && !emptyData) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Comment(
                        text: data[index].text,
                        author: data[index].author,
                      );
                    });
              } else {
                return SizedBox(
                  height: 500,
                  child: Center(
                    child: Text(
                      "Não há comentários para mostrar no momento",
                      style: TextStyle(
                          fontSize: 18.0, color: systemVoteTheme.white),
                    ),
                  ),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to
              .navigate('/comment/create-comment?idPost=${widget.idPost}');
        },
        tooltip: 'Adicionar Cometários',
        child: Icon(
          Icons.add,
          color: systemVoteTheme.white,
        ),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
      ),
    );
  }
}
