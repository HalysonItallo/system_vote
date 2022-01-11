import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(69, 69, 77, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
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
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
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
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
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
                          primary: Colors.white,
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
                        child: const Text('Cadastrar'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Modular.to.navigate('/');
                            },
                            child: const Text(
                              'Fazer login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
