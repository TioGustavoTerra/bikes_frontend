import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../componentes/button.dart';
import '../componentes/square_title.dart';
import '../componentes/textfield.dart';
import 'login_screen.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final cpfController = TextEditingController();
  final dataNascimentoController = TextEditingController();

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  get emailController => null;

  get confirmPasswordController => null;

  // get cpfController => null;

  get telController => null;

  get dataController => null;

  // sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
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
              Image.asset(
                'assets/site-sistema/cadastro/fundo-cadastro.jpg',
                width: MediaQuery.of(context).size.width * 40,
                height: MediaQuery.of(context).size.height * 40,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Cadastro
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  const Text("Cadastre grátis em nossa plataforma",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  //Cadastro

                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.only(
                          right: 60,
                          left: 60,
                          top: 60,
                          bottom: 60,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black26.withOpacity(_opacity),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        width: MediaQuery.of(context).size.width * 0.4,
                        // height: MediaQuery.of(context).size.height * 0.52,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("Dados pessoais",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.start),
                                MyTextField(
                                  controller: usernameController,
                                  hintText: 'Nome completo',
                                  obscureText: false,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyTextField(
                                          controller: cpfController,
                                          hintText: 'CPF',
                                          obscureText: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: MyTextField(
                                          controller: dataNascimentoController,
                                          hintText: 'Data de nascimento',
                                          obscureText: false,
                                        
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    // Expanded(
                                    //   child: MyTextField(
                                    //     decoration: InputDecoration(
                                    //       labelText: 'Telefone',
                                    //     ),
                                    //   ),
                                    // ),
                                    // Expanded(
                                    //   child: MyTextField(
                                    //     decoration: InputDecoration(
                                    //       labelText: 'E-mail',
                                    //     ),
                                    //   ),
                                    // ),
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
                                        "Cadastre sua senha na plataforma",
                                        style: TextStyle(
                                          color: Colors.white,
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
                                    const SizedBox(height: 5),
                                    MyPasswordTextField(
                                      controller: confirmPasswordController,
                                      hintText: 'Confirmar senha',
                                      obscureText: false,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    MyButtonAgree(
                                      text: "Cadastrar ->",
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
