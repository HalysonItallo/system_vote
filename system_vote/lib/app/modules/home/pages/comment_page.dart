import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../widgets/comment.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(69, 69, 77, 1),
      appBar: AppBar(
        title: const Text('Comentários'),
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
              Modular.to.navigate('/');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Comment(
            author: 'Halyson',
            text: 'Amor da minha vida',
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.navigate('/create-comment');
        },
        tooltip: 'Adicionar Post',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(255, 72, 147, 1),
      ),
    );
  }
}
