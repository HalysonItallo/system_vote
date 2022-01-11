import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

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
    String idString = id.toString();
    var formData = FormData.fromMap({
      'idUser': idString,
      'text': _textController.text,
      'author': _authorController.text,
    });
    var response =
        await dio.post('http://10.0.2.2:3333/createPost', data: formData);
    if (response.statusCode == 200) {
      Modular.to.navigate('/feed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(69, 69, 77, 1),
      appBar: AppBar(
        title: const Text('Criar Post'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
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
              color: const Color.fromRGBO(255, 72, 147, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    enableSuggestions: true,
                    controller: _authorController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Autor',
                      border: OutlineInputBorder(
                        gapPadding: 10,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.all(10),
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
                    cursorColor: Colors.white,
                    enableSuggestions: true,
                    controller: _textController,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Texto',
                      border: OutlineInputBorder(
                        gapPadding: 10,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      contentPadding: EdgeInsets.all(10),
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
