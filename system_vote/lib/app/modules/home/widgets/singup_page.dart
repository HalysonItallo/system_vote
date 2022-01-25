import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:system_vote/app/models/entities/user_model.dart';
import 'package:system_vote/app/repository/user_repository.dart';
import 'package:system_vote/shared/themes/theme.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final SystemVoteTheme systemVoteTheme = Modular.get<SystemVoteTheme>();
  final UserRepository userRepository = Modular.get<UserRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: systemVoteTheme.black,
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
                  color: systemVoteTheme.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: systemVoteTheme.white,
                        enableSuggestions: true,
                        controller: _nameController,
                        style: TextStyle(color: systemVoteTheme.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Nome',
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
                        controller: _emailController,
                        style: TextStyle(color: systemVoteTheme.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
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
                        controller: _passwordController,
                        style: TextStyle(color: systemVoteTheme.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Senha',
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
                          primary: systemVoteTheme.white,
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
                          bool result = await userRepository.createUser(
                            UserModel(
                              email: _emailController.text,
                              name: _nameController.text,
                              password: _passwordController.text,
                            ),
                          );
                          if (result) {
                            Modular.to.navigate('/');
                          }
                        },
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
