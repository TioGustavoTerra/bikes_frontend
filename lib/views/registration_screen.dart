import 'dart:html';
import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../componentes/button.dart';
import '../componentes/rodape.dart';
import '../componentes/square_title.dart';
import '../componentes/textfield.dart';
import 'bemvindo.dart';
import 'login_screen.dart';

class Signup extends StatelessWidget {
  Signup

  ({super.key});

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
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'assets/site-sistema/cadastro/fundo-cadastro.jpg',
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 40,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 40,
                fit: BoxFit.cover,
              ),
              Container(
                color: const Color.fromRGBO(30, 122   , 97, 100),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Cadastro
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05),
                  const Text("Cadastre grátis em nossa plataforma",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  //Cadastro

                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05),
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
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.4,
                        //height: MediaQuery.of(context).size.height * 0.52,
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
                                        color: Colors.black, fontSize: 20),
                                    textAlign: TextAlign.start),
                                  MyTextField(
                                    hintText: 'Nome completo',
                                    controller: usernameController,
                                    obscureText: false,
                                    inputFormatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                const SizedBox(height: 20),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyTextField(
                                        hintText: 'CPF',
                                        controller: cpfController,
                                        obscureText: false, inputFormatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CpfInputFormatter(),
                                      ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: MyTextField(
                                        hintText: 'Data de nascimento',
                                        controller: dataController,
                                        obscureText: false, inputFormatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        DataInputFormatter(),
                                      ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: MyTextField(
                                        hintText: 'Telefone',
                                        controller: telController,
                                        obscureText: false, inputFormatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        TelefoneInputFormatter(),
                                      ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: MyTextField(
                                        hintText: 'Email',
                                        controller: emailController,
                                        obscureText: false, inputFormatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
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
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    MyPasswordTextField(obscureText: true, controller: passwordController, hintText: 'senha',),

                                    const SizedBox(height: 20),

                                    const SizedBox(height: 5),

                                    MyPasswordTextField(obscureText: true, controller: confirmPasswordController, hintText: 'Confirmar senha',),

                                    const SizedBox(height: 20,),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 210, right: 210),
                                      child: MyButtonAgree(
                                        text: "Cadastrar",
                                        image: "site-sistema/Home/icone-seta.svg",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WelcomePage()));
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextButton(
                                      style: TextButton.styleFrom( textStyle: const TextStyle(fontSize: 0) ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/login');
                                      },
                                      child: const Text(
                                        'Já tem conta?',
                                        // padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 29, 118, 94),
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 20),),
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
}
