import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:system_vote/shared/themes/theme.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  Future<void> sendData() async {
    var dio = Dio();
    dynamic id = await SessionManager().get("id");

    var response = await dio.post('http://10.0.2.2:3333/createPost', data: {
      "text": _textController.text,
      "author": _authorController.text,
      "idUser": '$id',
    });
    if (response.statusCode == 200) {
      Modular.to.navigate('/feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
    return Scaffold(
      backgroundColor: systemVoteTheme.black,
      appBar: AppBar(
        title: const Text('Criar Post'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 300,
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
                  TextFormField(
                    cursorColor: systemVoteTheme.white,
                    enableSuggestions: true,
                    controller: _textController,
                    style: TextStyle(color: systemVoteTheme.white),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Texto',
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
                    child: const Text('Criar Post'),
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
