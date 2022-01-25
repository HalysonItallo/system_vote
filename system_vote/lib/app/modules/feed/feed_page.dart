import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/components/post.dart';
import 'package:system_vote/app/repository/post_repository.dart';
import 'package:system_vote/shared/themes/theme.dart';

import './feed_store.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedStore> {
  final PostRepository postRepository = Modular.get<PostRepository>();

  @override
  Widget build(BuildContext context) {
    final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();

    return Scaffold(
      backgroundColor: systemVoteTheme.black,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: systemVoteTheme.white,
          fontSize: 20,
        ),
        title: const Text('Feed'),
        backgroundColor: systemVoteTheme.primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.article,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              Modular.to.navigate('/my-topics/');
            },
            tooltip: 'Meus tópicos',
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              Modular.to.navigate('/my-favorites/');
            },
            tooltip: 'Meus favoritos',
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: systemVoteTheme.white,
            ),
            onPressed: () async {
              await store.logout();
            },
            tooltip: 'Sair',
          ),
        ],
      ),
      body: FutureBuilder(
        future: postRepository.getAllPosts(),
        builder: (_, AsyncSnapshot snapshot) {
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
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Post(
                      text: data[index].text,
                      isMoreLikded:
                          data[index].countLike > data[index].countDislike
                              ? true
                              : false,
                      author: data[index].author,
                      idPost: data[index].id,
                    );
                  },
                );
              } else {
                return SizedBox(
                  height: 500,
                  child: Center(
                    child: Text(
                      "Não há posts para mostrar no momento",
                      style: TextStyle(
                          fontSize: 20.0, color: systemVoteTheme.white),
                    ),
                  ),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/feed/new-post/');
        },
        tooltip: 'Adicionar Post',
        child: Icon(
          Icons.add,
          color: systemVoteTheme.white,
        ),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
      ),
    );
  }
}
