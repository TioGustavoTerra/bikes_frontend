import 'dart:ui';

import 'package:bikes_frontend/componentes/messages.dart';
import 'package:bikes_frontend/services/loginUser_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../componentes/button.dart';
import '../componentes/rodape.dart';
import '../componentes/square_title.dart';
import '../componentes/textfield.dart';
import 'bemvindo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  LoginUserService _loginService = LoginUserService();
  late String _username;
  late String _password;

  get confirmPasswordController => null;

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'assets/site-sistema/cadastro/fundo-cadastro.jpg',
                width: MediaQuery.of(context).size.width * 40,
                height: MediaQuery.of(context).size.height * 40,
                fit: BoxFit.cover,
              ),
              Container(
                color: const Color.fromRGBO(30, 122, 97, 100),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Acesse
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Text("Acesse sua conta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  //Acesse

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(),
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 60,
                          left: 60,
                          top: 60,
                          bottom: 60,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: MediaQuery.of(context).size.width * 0.4,
                        //height: MediaQuery.of(context).size.height * 0.52,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("Login",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    textAlign: TextAlign.start),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyTextField(
                                        hintText: 'Email',
                                        controller: emailController,
                                        obscureText: false,
                                        inputFormatter: [],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "Senha",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    MyPasswordTextField(
                                      obscureText: true,
                                      controller: passwordController,
                                      hintText: 'senha',
                                    ),
                                    const SizedBox(height: 20),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 210, right: 210),
                                      child: MyButtonAgree(
                                        text: "Entrar",
                                        image:
                                            "site-sistema/Home/icone-seta.svg",
                                        onTap: () {
                                          Logar(emailController.text,
                                              passwordController.text);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              const Text('Esqueçeu sua senha? ',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 29, 118, 94),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                  textAlign: TextAlign.center),
                                              const Text(
                                                '/ ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              const Text(
                                                'Não tem conta?',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(width: 4),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    textStyle: const TextStyle(
                                                        fontSize: 20)),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/register');
                                                },
                                                child: const Text(
                                                  'Faça o cadastro',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 29, 118, 94),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Ou',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // facebook button
                                          SquareTile(
                                              imagePath:
                                                  'site-sistema/Menu/botao-facebook.svg',
                                              title: "Continue com Facebook"),

                                          SizedBox(height: 15),

                                          SquareTile(
                                            imagePath: 'site-sistema/',
                                            title: "Continue com Google",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Rodape()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Logar(String email, String senha) async {
    try {
      if (_formKey.currentState!.validate()) {
        String? token = await _loginService.logar(email, senha);

        if (token!.isEmpty) {
          _showToastErro(context, 'Ops, algo deu errado!');
        } else {
          _showToastInfo(context, 'Login realizado com Sucesso!');
          Navigator.pushNamed(context, "/home");
        }
      } else {
        _showToastErro(context, 'Favor preencher todos os campos!');
      }
    } catch (e) {
      _showToastErro(context, e);
    }
  }

  void _showToastErro(BuildContext context, msg) {
    Messages.of(context).showError(msg);
  }

  void _showToastInfo(BuildContext context, msg) {
    Messages.of(context).showInfo(msg);
  }
}
