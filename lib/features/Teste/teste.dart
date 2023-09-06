import 'package:bikes_frontend/features/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../componentes/button.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyButtonAgree(
                          text: "Assinar",
                          image: "site-sistema/Home/icone-seta.svg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                        ),
    );
  }
}
