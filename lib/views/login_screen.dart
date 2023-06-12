import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../componentes/button.dart';
import '../componentes/square_title.dart';
import '../componentes/textfield.dart';
import 'bemvindo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  get confirmPasswordController => null;

  get passwordController => null;

  get emailController => null;

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
                color: Color.fromRGBO(30, 122, 97, 100),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Cadastro
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Text("Acesse sua conta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  //Cadastro

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
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
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
                                        controller: emailController,
                                        hintText: 'E-mail',
                                        obscureText: false,
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
                                      controller: passwordController,
                                      hintText: 'Senha',
                                      obscureText: false,
                                    ),
                                    SizedBox(height: 20),
                                    const SizedBox(height: 5),
                                    MyPasswordTextField(
                                      controller: confirmPasswordController,
                                      hintText: 'Confirmar senha',
                                      obscureText: false,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 210, right: 210),
                                      child: MyButtonAgree(
                                        text: "Entrar ->",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WelcomePage()));
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
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
                                              const Text('Esqueçeu a senha? ',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 29, 118, 94),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                  textAlign: TextAlign.center),
                                              Text(
                                                '/ ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'Não tem conta?',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                'Faça o cadastro',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 29, 118, 94),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
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
                                          SizedBox(height: 10),

                                          SquareTile(
                                            imagePath:
                                                'site-sistema/Menu/botao-instagram.svg',
                                            title: "Continue com Instagram",
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
            ],
          ),
        ),
      ),
    );
  }
}
