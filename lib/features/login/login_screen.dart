import 'dart:ui';

import 'package:bikes_frontend/componentes/messages.dart';
import 'package:bikes_frontend/services/login_service.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../../componentes/button.dart';
import '../../componentes/square_title.dart';
import '../../componentes/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final LoginUserService _loginService = LoginUserService();
  // late String _username;
  // late String _password;

  get confirmPasswordController => null;

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  void dispose() {
    Messages.of(context).fecharMessagem(1);
    super.dispose();
  }

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
                color: const Color.fromARGB(100, 9, 188, 138),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Text("Acesse sua conta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
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
                                    inputFormatter: const [],
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
                                                          255, 9, 188, 138),
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
                                                    context, '/registro');
                                              },
                                              child: const Text(
                                                'Faça o cadastro',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 9, 188, 138),
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const SquareTile(
                                              imagePath:
                                                  'site-sistema/cadastro/botao-google.svg',
                                              title: "Login com Google"),
                                        ),
                                        const SizedBox(height: 10),
                                        InkWell(
                                          onTap: () {},
                                          child: const SquareTile(
                                            imagePath:
                                                'site-sistema/cadastro/botao-facebook2.svg',
                                            title: "Login com Facebook",
                                          ),
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
            ],
          ),
        ),
      ),
      // Rodape()
    );
  }

  Future<void> Logar(String email, String senha) async {
    try {
      if (_formKey.currentState!.validate()) {
        String? token = await _loginService.logar(email, senha);
        // Map<String, dynamic> data = await _loginService.logar(email, senha);

        //   final SharedPreferences prefs = await SharedPreferences.getInstance();
        //   await prefs.setString('nome', data['nome']);
        //   await prefs.getString('nome');

        if (token!.isEmpty) {
          _showToastErro(context, 'Ops, algo deu errado!');
        } else {
          _showToastInfo(context, 'Login realizado com Sucesso!');

          Messages.of(context).fecharMessagem(1).then((value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/home",
              ModalRoute.withName('/'),
            );
          });
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
