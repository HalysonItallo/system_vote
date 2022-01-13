import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/components/post/post.dart';
import 'package:http/http.dart' as http;
import 'package:system_vote/shared/themes/theme.dart';

import './feed_store.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedStore> {
  late Future _futureData;

  @override
  void initState() {
    _futureData = getPosts();
    super.initState();
  }

  Future<List> getPosts() async {
    var url = Uri.parse('http://10.0.2.2:3333/getAllPosts');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

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
              Modular.to.navigate('/my-topics');
            },
            tooltip: 'Meus tópicos',
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              Modular.to.navigate('/my-favorites');
            },
            tooltip: 'Meus favoritos',
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              store.logout();
            },
            tooltip: 'Sair',
          ),
        ],
      ),
      body: FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Post(
                    text: snapshot.data[index]['text'],
                    isMoreLikded: snapshot.data[index]['countLike'] >
                            snapshot.data[index]['countDislike']
                        ? true
                        : false,
                    author: snapshot.data[index]['author'],
                    idPost: snapshot.data[index]['id'],
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/new-post');
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
