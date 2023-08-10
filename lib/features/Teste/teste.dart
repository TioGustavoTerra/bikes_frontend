import 'dart:ui';

import 'package:bikes_frontend/componentes/destaque.dart';
import 'package:bikes_frontend/componentes/qual_estilo.dart';
import 'package:bikes_frontend/componentes/rodape.dart';
import 'package:bikes_frontend/componentes/rodapeApp.dart';
// import 'package:bikes_frontend/componentes/grid_marcas.dart';
import 'package:flutter/material.dart';

import '../../componentes/button.dart';
import '../../componentes/square_title.dart';
import '../../componentes/textfield.dart';
import '../../utils/responsive.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  
  get passwordController => null;
  
  get emailController => null;

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Text("Acesse sua conta",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),


                 ] );
  }
}