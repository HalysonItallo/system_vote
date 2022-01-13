import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/shared/themes/theme.dart';

class CreateCommentPage extends StatefulWidget {
  final String? idPost;
  const CreateCommentPage({Key? key, this.idPost}) : super(key: key);

  @override
  _CreateCommentPageState createState() => _CreateCommentPageState();
}

class _CreateCommentPageState extends State<CreateCommentPage> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  Future<void> sendData() async {
    var dio = Dio();

    var response = await dio.post('http://10.0.2.2:3333/createComment', data: {
      "idPost": Modular.args.queryParams['idPost'],
      "text": _commentController.text,
      "author": _authorController.text,
    });
    if (response.statusCode == 200) {
      Modular.to
          .navigate('/comment?idPost=${Modular.args.queryParams['idPost']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
    return Scaffold(
      backgroundColor: systemVoteTheme.black,
      appBar: AppBar(
        title: const Text('Criar Comentário'),
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
              Modular.to.navigate('/comment');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: systemVoteTheme.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: systemVoteTheme.white,
                    enableSuggestions: true,
                    controller: _commentController,
                    style: TextStyle(color: systemVoteTheme.white),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Comentário',
                      border: const OutlineInputBorder(
                        gapPadding: 10,
                      ),
                      labelStyle: TextStyle(
                        color: systemVoteTheme.white,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira algum texto';
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: systemVoteTheme.white,
                    enableSuggestions: true,
                    controller: _authorController,
                    style: TextStyle(color: systemVoteTheme.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Autor',
                      border: const OutlineInputBorder(
                        gapPadding: 10,
                      ),
                      labelStyle: TextStyle(
                        color: systemVoteTheme.white,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor insira algum texto';
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      sendData();
                    },
                    child: const Text('Criar Comentário'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
