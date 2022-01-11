import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(69, 69, 77, 1),
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        title: const Text('Meus Favoritos'),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.article,
              color: Colors.white,
            ),
            onPressed: () {
              Modular.to.navigate('/my-topics');
            },
            tooltip: 'Meus tópicos',
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Modular.to.navigate('/my-favorites');
            },
            tooltip: 'Meus favoritos',
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
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
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 72, 147,
                                    1), //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
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
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index]['author'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
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
