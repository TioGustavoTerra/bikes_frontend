import 'dart:ui';

import 'package:bikes_frontend/componentes/messages.dart';
import 'package:bikes_frontend/services/loginUser_service.dart';
import 'package:bikes_frontend/utils/responsive.dart';
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  //Acesse

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(),
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 10,
                          left: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width * 0.4
                            : null,
                        height: Responsive.isTablet(context)
                            ? MediaQuery.of(context).size.height * 0.80
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text("Login",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                        textAlign: TextAlign.start),
                                  ),
                                  MyTextField(
                                    hintText: 'Email',
                                    controller: emailController,
                                    obscureText: false,
                                    inputFormatter: [],
                                  ),
                                  const SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                      "Senha",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  MyPasswordTextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    hintText: 'Senha',
                                  ),
                                  const SizedBox(height: 10),
                                  MyButtonAgree(
                                    text: "Entrar",
                                    image: "site-sistema/Home/icone-seta.svg",
                                    onTap: () {
                                      Logar(emailController.text,
                                          passwordController.text);
                                    },
                                  ),
                                  // ),
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
                                        const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text('Esqueçeu sua senha? ',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 29, 118, 94),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                  textAlign: TextAlign.center),
                                              Text(
                                                '/ ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'Não tem conta?',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(width: 4),
                                            ]),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14)),
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/register');
                                              },
                                              child: const Text(
                                                'Faça o cadastro',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 29, 118, 94),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
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
                                        color: Colors.black, fontSize: 14),
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

                                        SizedBox(height: 10),

                                        SquareTile(
                                          imagePath: 'site-sistema/',
                                          title: "Continue com Google",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // ],
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // const Rodape()
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
