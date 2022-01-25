import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/repository/post_repository.dart';
import 'package:system_vote/shared/themes/theme.dart';

class MyFavoritePage extends StatefulWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  State<MyFavoritePage> createState() => _MyFavoritePageState();
}

class _MyFavoritePageState extends State<MyFavoritePage> {
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
        title: const Text('Meus Favoritos'),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
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
              Icons.arrow_back,
              color: systemVoteTheme.white,
            ),
            onPressed: () {
              Modular.to.navigate('/feed/');
            },
            tooltip: 'Voltar',
          ),
        ],
      ),
      body: FutureBuilder(
        future: postRepository.getAllPosts(),
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
                      return data[index].countLike > data[index].countDislike
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
                                              "${data[index].text}",
                                              maxLines: 4,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: systemVoteTheme.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${data[index].author}",
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
                return const SizedBox(
                  height: 500,
                  child: Center(
                    child: Text(
                      "Não há posts para mostrar no momento",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
