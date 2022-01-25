import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/shared/themes/theme.dart';

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
    final SystemVoteTheme _systemVoteTheme = Modular.get<SystemVoteTheme>();
    return Scaffold(
      backgroundColor: _systemVoteTheme.black,
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
                  color: _systemVoteTheme.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: _systemVoteTheme.white,
                        controller: _emailController,
                        enableSuggestions: true,
                        style: TextStyle(color: _systemVoteTheme.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: const OutlineInputBorder(
                            gapPadding: 10,
                          ),
                          labelStyle: TextStyle(
                            color: _systemVoteTheme.white,
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
                        cursorColor: _systemVoteTheme.white,
                        controller: _passwordController,
                        enableSuggestions: true,
                        style: TextStyle(color: _systemVoteTheme.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: const OutlineInputBorder(
                            gapPadding: 10,
                          ),
                          labelStyle: TextStyle(
                            color: _systemVoteTheme.white,
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
                      Observer(builder: (context) {
                        return Text(
                          store.validity ? '' : 'Verifique seu e-mail ou senha',
                          style: TextStyle(color: _systemVoteTheme.white),
                        );
                      }),
                      Container(
                        height: 20,
                      ),
                      Builder(builder: (context) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: _systemVoteTheme.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            bool result = await store.getLogin(
                              _emailController.text,
                              _passwordController.text,
                            );
                            if (result) {
                              Modular.to.navigate('/feed/');
                            }
                          },
                          child: const Text('Entrar'),
                        );
                      }),
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
