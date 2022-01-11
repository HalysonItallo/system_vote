import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateCommentPage extends StatefulWidget {
  const CreateCommentPage({Key? key}) : super(key: key);

  @override
  _CreateCommentPageState createState() => _CreateCommentPageState();
}

class _CreateCommentPageState extends State<CreateCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(69, 69, 77, 1),
      appBar: AppBar(
        title: const Text('Criar Comentário'),
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
              Modular.to.navigate('/comment');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 250,
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
                    style: const TextStyle(color: Colors.white),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: 'Comentário',
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
                    onPressed: () {},
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
