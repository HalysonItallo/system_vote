import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:system_vote/shared/themes/theme.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
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
        title: const Text('Meus Favoritos'),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
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
              Icons.arrow_back,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              Modular.to.navigate('/feed');
            },
            tooltip: 'Voltar',
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
                  return snapshot.data[index]['countLike'] >
                          snapshot.data[index]['countDislike']
                      ? SizedBox(
                          width: 800,
                          height: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: systemVoteTheme
                                    .primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: const [
                                          Icon(Icons.star,
                                              color: Colors.yellow),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 150,
                                        child: Text(
                                          snapshot.data[index]['text'],
                                          maxLines: 4,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: systemVoteTheme.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index]['author'],
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
                        )
                      : Container();
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
