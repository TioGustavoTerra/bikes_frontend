import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:flutter/material.dart';

import '../componentes/rodapehome.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < 800
              ? PreferredSize(
            child: CabecalhoApp(),
            preferredSize: const Size(double.infinity, 56),
          )
              : AppBar(),
          drawer: Drawer(),


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
      },
    );
  }
}