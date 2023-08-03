import 'package:bikes_frontend/componentes/destaque.dart';
import 'package:bikes_frontend/componentes/rodape.dart';
import 'package:bikes_frontend/componentes/rodapeApp.dart';
// import 'package:bikes_frontend/componentes/grid_marcas.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const RodapeApp();
  }
}