// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:bikes_frontend/componentes/square_title.dart';
import 'package:bikes_frontend/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../componentes/button.dart';
import '../componentes/rodape.dart';
import '../componentes/cabecalho.dart';
import '../componentes/rodapehome.dart';
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
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 300),
            SvgPicture.asset(
              'site-sistema/Menu/Logo-bikes.svg',
              width: 55,
              height: 55,
            ),
            SizedBox(width: 100),
            SizedBox(height: 100),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Quem somos',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Comprar',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Vender',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Contato',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 40),
            SvgPicture.asset(
              'site-sistema/Menu/botao-carrinho.svg',
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              'site-sistema/Menu/botao-lista-de-desejos.svg',
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              'site-sistema/Menu/botao-entrar.svg',
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                '| Entrar',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'CRIE SUA CONTA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'site-sistema/Menu/botao-whatsapp.svg',
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'site-sistema/Menu/botao-facebook.svg',
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'site-sistema/Menu/botao-instagram.svg',
            ),

          ],
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(height: 50),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
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
              const Rodape2(),
            ],
          ),
        ),
      ),
    );
  }
}