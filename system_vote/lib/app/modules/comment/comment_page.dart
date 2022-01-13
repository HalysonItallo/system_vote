import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:system_vote/app/components/comment.dart';
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
  late Future _futureData;

  @override
  void initState() {
    _futureData = getComments();
    super.initState();
  }

  Future<List> getComments() async {
    var url = Uri.parse(
        'http://10.0.2.2:3333/getAllComments/${Modular.args.queryParams['idPost']}');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

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
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Comment(
                    text: snapshot.data[index]['text'],
                    author: snapshot.data[index]['author'],
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
          Modular.to.navigate('/create-comment?idPost=${widget.idPost}');
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
