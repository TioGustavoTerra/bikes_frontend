// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:bikes_frontend/componentes/square_title.dart';
import 'package:bikes_frontend/views/registration_screen.dart';
import 'package:flutter/material.dart';


import '../componentes/button.dart';
import '../componentes/textfield.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  // sign user in method
  // void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                color: Color.fromRGBO(30, 122, 97, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}