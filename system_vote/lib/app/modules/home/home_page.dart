import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                height: 350,
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
                        controller: _emailController,
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
                        controller: _passwordController,
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
                      Observer(builder: (context) {
                        return Text(
                          store.isLogged ? '' : 'Verifique seu e-mail ou senha',
                          style: const TextStyle(color: Colors.white),
                        );
                      }),
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
                        onPressed: () {
                          store.getLogin(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                        child: const Text('Entrar'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Modular.to.navigate('/singup');
                            },
                            child: const Text(
                              'Cadastrar-se',
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
