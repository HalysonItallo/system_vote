import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:system_vote/shared/themes/theme.dart';

class MyTopicsPage extends StatefulWidget {
  const MyTopicsPage({Key? key}) : super(key: key);

  @override
  State<MyTopicsPage> createState() => _MyTopicsPageState();
}

class _MyTopicsPageState extends State<MyTopicsPage> {
  late Future _futureData;

  @override
  void initState() {
    _futureData = getMyPosts();
    super.initState();
  }

  Future<List> getMyPosts() async {
    dynamic id = await SessionManager().get("id");
    var url = Uri.parse('http://10.0.2.2:3333/getMyPosts/$id');
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
        title: const Text('Meus Tópicos'),
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
                  return SizedBox(
                    width: 800,
                    height: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: systemVoteTheme
                              .primaryColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
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
                                  'Autor: ${snapshot.data[index]['author']}',
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
